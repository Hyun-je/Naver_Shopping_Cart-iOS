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
    
    private let searchService: AnyNaverSearchService<NaverShopSearchResult>
    private let openMarket = Set(["네이버", "11번가", "G마켓", "옥션", "위메프", "쿠팡", "인터파크", "SSG닷컴", "롯데ON", "티몬", "G9", "롯데홈쇼핑", "GSSHOP", "신세계몰", "현대Hmall"])
    private var mallDict = [String: [String: Int]]()
    
    
    init(searchService: AnyNaverSearchService<NaverShopSearchResult>) {
       self.searchService = searchService
    }

    func addKeyword(with keyword: String) {
        keywords.append(keyword)
    }
    
    func removeKeyword(at indexSet: IndexSet) {
        keywords.remove(atOffsets: indexSet)
    }
    
    func search() async {
        
        mallDict = [:]
        
        
        for keyword in keywords {
            
            if let result = try? await searchService.request(query: keyword, options: ["display": "100"]) {

                result.items
                .filter { $0.productType == "2" || $0.productType == "3" } // 일반 상품 아닌 것 제거
                .forEach { item in
                    
                    if let lprice = Int(item.lprice) {
                        addMall(product: keyword, mall: item.mallName, price: lprice)
                    }

                }
  
            }

        }
        
        
        let mallsArray = mallDict
            .filter { $1.count == keywords.count }
            .map { (mall, products) -> (name: String, price: Int) in
                let price = products
                    .map { $1 }
                    .reduce(0) { $0 + $1 }
                return (name: mall, price: price)
            }
            .sorted { $0.price < $1.price }
        
        await updateMall(malls: mallsArray)
        
    }
    
    @MainActor
    private func updateMall(malls: [(name: String, price: Int)]) {
        self.malls = malls.map { "\($0.name)" }
        self.prices = malls.map { "\($0.price)" }
    }
    
    
    func addMall(product: String, mall: String, price: Int) {
        
        if openMarket.contains(mall) {
            return
        }
        
        if mallDict[mall] == nil {
            mallDict[mall] = [:]
        }
        
        mallDict[mall]?[product] = price
        
    }
    
}
