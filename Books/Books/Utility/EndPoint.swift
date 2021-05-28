//
//  EndPoint.swift
//  Books
//
//  Created by Yogesh Bhople on 14/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import Foundation
//https://www.googleapis.com/books/v1/volumes?q=apple
//startIndex
//maxResults
struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"
        components.path = "/" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }

        return url
    }
}

extension Endpoint {
    static var recommendations: Self {
        Endpoint(path: "recommendations")
    }

    static func search(for query: String,
                       maxResultCount: Int = 10,startIndex: Int = 0) -> Self {
        Endpoint(
            path: "books/v1/volumes/",
            queryItems: [URLQueryItem(
                name: "q",
                value: query
            ),URLQueryItem(
                name: "startIndex",
                value: String(startIndex)
            ),URLQueryItem(
                name: "maxResults",
                value: String(maxResultCount)
            )]
        )
    }
}
