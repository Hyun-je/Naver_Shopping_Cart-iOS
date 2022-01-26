//
//  SearchSceneModel.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import Combine
import Foundation


class SearchSceneModel: SearchSceneInterface {
    
    @Published var keywords = [String]()
    @Published var malls = [String]()
    @Published var prices = [String]()
    
    

    func addKeyword(with keyword: String) {
        keywords.append(keyword)
    }
    
    func removeKeyword(at indexSet: IndexSet) {
        keywords.remove(atOffsets: indexSet)
    }
    
    func search() async {
        
        guard var service = NaverShopSearch()
        else { return }
        
        for keyword in keywords {
            
            service.query = keyword
            
            if let result = try? await service.request() {
                
                print(result.items)
  
            }

        }

        
    }

    
}
