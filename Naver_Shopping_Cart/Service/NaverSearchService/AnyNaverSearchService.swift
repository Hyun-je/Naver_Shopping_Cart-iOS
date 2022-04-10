//
//  AnyNaverSearchService.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/30.
//

import Foundation

struct AnyNaverSearchService<SearchResult: Decodable>: NaverSearchService {

    let path: String

    init<Service: NaverSearchService>(_ service: Service) where Service.SearchResult == SearchResult {

        self.path = service.path
    }

}

extension NaverSearchService {

    func eraseType() -> AnyNaverSearchService<SearchResult> {

        return AnyNaverSearchService<SearchResult>(self)
    }

}
