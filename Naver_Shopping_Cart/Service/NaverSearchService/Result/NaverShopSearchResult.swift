//
//  NaverShopSearchResult.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import Foundation

struct NaverShopSearchResult: Decodable {

    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Item]

    struct Item: Decodable {

        let title: String
        let link: String
        let image: String
        let lprice: String
        let hprice: String
        let mallName: String
        let productId: String
        let productType: String
        let brand: String
        let maker: String
        let category1: String
        let category2: String
        let category3: String
        let category4: String

    }

}
