//
//  NaverShopSearch.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import Foundation


struct NaverShopSearch: NaverSearchAPI {

    typealias NaverSearchResult = NaverShopSearchResult
    
    let path = "/shop"
    var queryItems = [String : String]()
    
    let clientId: String
    let clientSecret: String
    
    init?() {
        
        guard let clientId = UserDefaults.standard.string(forKey: "clientId"),
              let clientSecret = UserDefaults.standard.string(forKey: "clientSecret")
        else { return nil }
    
        self.clientId = clientId
        self.clientSecret = clientSecret
        
    }
    
    var query: String? {
        set { queryItems["query"] = newValue }
        get { return queryItems["query"] }
    }
    
    var display: String? {
        set { queryItems["display"] = newValue }
        get { return queryItems["display"] }
    }
    
    var start: String? {
        set { queryItems["start"] = newValue }
        get { return queryItems["start"] }
    }
    
    var sort: String? {
        set { queryItems["sort"] = newValue }
        get { return queryItems["sort"] }
    }
    
}
