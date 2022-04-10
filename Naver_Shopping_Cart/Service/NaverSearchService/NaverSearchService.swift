//
//  NaverSearchService.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/29.
//

import Foundation

protocol NaverSearchService where SearchResult: Decodable {

    associatedtype SearchResult

    var host: String { get }
    var path: String { get }

    var clientId: String { get }
    var clientSecret: String { get }

    func request(query: String, options: [String: String]?) async throws -> SearchResult?

}

extension NaverSearchService {

    var host: String { "https://openapi.naver.com/v1/search" }

    var clientId: String { UserDefaults.standard.string(forKey: "clientId") ?? "" }
    var clientSecret: String { UserDefaults.standard.string(forKey: "clientSecret") ?? "" }

    func request(query: String, options: [String: String]? = nil) async throws -> SearchResult? {

        var urlComponents = URLComponents(string: host + path)
        urlComponents?.queryItems =
            [ URLQueryItem(name: "query", value: query) ]
            + (options?.map { URLQueryItem(name: $0, value: $1) } ?? [])

        var urlRequest = URLRequest(url: urlComponents!.url!)
        urlRequest.addValue("plain/text", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        urlRequest.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")

        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let jsonObject = try JSONDecoder().decode(SearchResult.self, from: data)

        return jsonObject
    }

}
