//
//  Naver_Shopping_CartApp.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import SwiftUI

@main
struct Naver_Shopping_CartApp: App {
    var body: some Scene {
        WindowGroup {
            SearchScene(model: SearchSceneModel(searchService: NaverShopSearch().eraseType()))
        }
    }
}
