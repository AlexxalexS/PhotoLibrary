//
//  NetworkDataFetcher.swift
//  PhotoLibrary
//
//  Created by Leha on 05.05.2022.
//

import Foundation

class NetworkDataFetcher {

    var networkService = NetworkService()

    func fetchImages(searchTerm: String, completion: @escaping (SearchResult?) -> ()) {
        networkService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print("Error received request data: \(error.localizedDescription)")
                completion(nil)
            }

            let decoded = self.decodeJSON(type: SearchResult.self, from: data)
            completion(decoded)
        }
    }

    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }

        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }

}
