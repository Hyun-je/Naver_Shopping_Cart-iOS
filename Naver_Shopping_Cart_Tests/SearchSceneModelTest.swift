//
//  SearchSceneModelTest.swift
//  Naver_Shopping_Cart_Tests
//
//  Created by Jaehyeon Park on 2022/01/31.
//

import XCTest

class SearchSceneModelTest: XCTestCase {

    var searchSceneModel: SearchSceneModel = {

        let searchService = NaverShopSearch()
        return SearchSceneModel(searchService: searchService.eraseType())

    }()

    func testAddKeyword() throws {

        let keywords = ["iPhone", "iPad", "MacBook", "AirPods"]

        keywords.forEach {
            searchSceneModel.addKeyword(with: $0)
        }

        XCTAssertEqual(searchSceneModel.keywords, keywords)

    }

    func testRemoveKeyword() throws {

        searchSceneModel.keywords = ["iPhone", "iPad", "MacBook", "AirPods"]

        searchSceneModel.removeKeyword(at: IndexSet(integer: 1))

        XCTAssertEqual(searchSceneModel.keywords, ["iPhone", "MacBook", "AirPods"])
    }

}
