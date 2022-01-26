//
//  NaverSearchAPI.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import Foundation


protocol NaverSearchAPI where NaverSearchResult: Decodable {
    
    associatedtype NaverSearchResult

    var host: String { get }
    var path: String { get }
    var query: [String: String] { get }
    
    var clientId: String { get }
    var clientSecret: String { get }
    
    func request() async throws -> NaverSearchResult?

}


extension NaverSearchAPI {
    
    var host: String { "https://openapi.naver.com/v1/search" }
    
    var urlRequest: URLRequest {
        
        var urlComponents = URLComponents(string: host + path)
        urlComponents?.queryItems = query.map { URLQueryItem(name: $0, value: $1) }
    
        var request = URLRequest(url: urlComponents!.url!)
        request.addValue("plain/text", forHTTPHeaderField: "Content-Type")
        request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return request
        
    }
    
    func request() async throws -> NaverSearchResult? {
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let jsonObject = try JSONDecoder().decode(NaverSearchResult.self, from: data)
        
        return jsonObject
    }
    
}
