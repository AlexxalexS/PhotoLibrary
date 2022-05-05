//
//  NetworkService.swift
//  PhotoLibrary
//
//  Created by Leha on 05.05.2022.
//

import Foundation

class NetworkService {

    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {

        let parameters = prepareParams(searchTerm: searchTerm)
        let url = url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    private func prepareHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID kBUnMtfKoRsdcOmZctdc99McmJSag2MJMQH_HDqW1NA"
        return headers
    }

    private func prepareParams(searchTerm: String) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = "1"
        parameters["per_page"] = "30"
        return parameters
    }

    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }

        return components.url ?? URL(fileURLWithPath: "")
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }

}
