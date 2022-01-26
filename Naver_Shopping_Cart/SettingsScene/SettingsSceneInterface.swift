//
//  SettingsSceneInterface.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import SwiftUI


protocol SettingsSceneInterface: ObservableObject {

    var clientId: String { get set }
    var clientSecret: String { get set }
    var version: String { get }
    
}
