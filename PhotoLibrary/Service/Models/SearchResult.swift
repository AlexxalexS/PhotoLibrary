//
//  SearchResult.swift
//  PhotoLibrary
//
//  Created by Leha on 05.05.2022.
//

import Foundation

struct SearchResult: Decodable {

    let total: Int
    let results: [UnsplashPhoto]

}

struct UnsplashPhoto: Decodable {

    let width: Int
    let height: Int
    let urls: [URLKing.RawValue: String]


    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }

}
