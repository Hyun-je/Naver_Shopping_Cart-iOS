//
//  NaverMovieSearchResult.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/30.
//

import Foundation

struct NaverMovieSearchResult: Decodable {

    let lastBuildDate: String
    let items: [Item]

    struct Item: Decodable {

        let title: String
        let link: String
        let image: String
        let subtitle: String
        let pubDate: String
        let director: String
        let actor: String
        let userRating: String

    }

}
