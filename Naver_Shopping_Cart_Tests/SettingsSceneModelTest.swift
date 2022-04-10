//
//  SettingsSceneModelTest.swift
//  Naver_Shopping_Cart_Tests
//
//  Created by Jaehyeon Park on 2022/01/31.
//

import XCTest

class SettingsSceneModelTest: XCTestCase {

    func testClientId() throws {

        let clientId = "9F2bdEf01zaQ"

        UserDefaults.standard.set(clientId, forKey: "clientId")
        UserDefaults.standard.synchronize()

        let settingsSceneModel: SettingsSceneModel = .init()
        XCTAssertEqual(settingsSceneModel.clientId, clientId)

        let newClientId = "4SeP03xeW3Nm"
        settingsSceneModel.clientId = newClientId

        XCTAssertEqual(newClientId, UserDefaults.standard.string(forKey: "clientId"))

    }

    func testClientSecret() throws {

        let clientSecret = "52Df0Ujq2nLQw"

        UserDefaults.standard.set(clientSecret, forKey: "clientSecret")
        UserDefaults.standard.synchronize()

        let settingsSceneModel: SettingsSceneModel = .init()
        XCTAssertEqual(settingsSceneModel.clientSecret, clientSecret)

    }

}
