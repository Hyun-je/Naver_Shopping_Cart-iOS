//
//  SettingsSceneModel.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import Combine
import Foundation

class SettingsSceneModel: SettingsSceneInterface {

    @Published var clientId: String = ""
    @Published var clientSecret: String = ""
    @Published var version: String = ""

    private var cancelBag = Set<AnyCancellable>()

    init() {

        clientId = UserDefaults.standard.string(forKey: "clientId") ?? ""
        clientSecret = UserDefaults.standard.string(forKey: "clientSecret") ?? ""

        let plistDict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Info", ofType: "plist")!)
        version = plistDict?["CFBundleShortVersionString"] as? String ?? "Unknown"

        $clientId
        // .debounce(for: 0.3, scheduler: RunLoop.main)
        .sink { newValue in
            UserDefaults.standard.set(newValue, forKey: "clientId")
            UserDefaults.standard.synchronize()
        }
        .store(in: &cancelBag)

        $clientSecret
        // .debounce(for: 0.3, scheduler: RunLoop.main)
        .sink { newValue in
            UserDefaults.standard.set(newValue, forKey: "clientSecret")
            UserDefaults.standard.synchronize()
        }
        .store(in: &cancelBag)

    }

}
