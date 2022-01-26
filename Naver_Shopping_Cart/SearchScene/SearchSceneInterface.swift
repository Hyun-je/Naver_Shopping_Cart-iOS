//
//  SearchSceneInterface.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import SwiftUI


protocol SearchSceneInterface: ObservableObject {
    
    var keywords: [String] { get }
    var malls: [String] { get }
    var prices: [String] { get }
    
    func addKeyword(with keyword: String)
    func removeKeyword(at indexSet: IndexSet)
    func search() async
    
}
