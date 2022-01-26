//
//  NaverSearchAPI.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import Foundation


protocol NaverSearchAPI {
    
    var host: String { get }
    var path: String { get }
    var query: [String: String] { get }
    
    var clientId: String { get }
    var clientSecret: String { get }
    
    var urlRequest: URLRequest? { get }
    
}


extension NaverSearchAPI {
    
    var urlRequest: URLRequest? {
        
        var urlComponents = URLComponents(string: host + path)
        urlComponents?.queryItems = query.map { URLQueryItem(name: $0, value: $1) }
    
        var request = URLRequest(url: urlComponents!.url!)
        request.addValue("plain/text", forHTTPHeaderField: "Content-Type")
        request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return request
        
    }
    
}
