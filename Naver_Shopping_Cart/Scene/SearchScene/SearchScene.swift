//
//  SearchScene.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import SwiftUI

protocol SearchSceneInterface: KeywordSectionInterface, SearchResultSectionInterface {

    func search() async

}

struct SearchScene<Model>: View where Model: SearchSceneInterface {

    @StateObject var model: Model

    var body: some View {

        NavigationView {

            List {

                KeywordSection(model: model)

                Button(
                    action: { },
                    label: {
                        HStack {
                            Spacer()
                            Text("๊ฒ์")
                                .foregroundColor(Color.accentColor)
                            Spacer()
                        }
                    }
                )

                SearchResultSection(model: model)

            }
            .navigationTitle("๐ ๋ค์ด๋ฒ ์ผํ ์นดํธ")
            .navigationBarItems(
                leading:
                    EmptyView(),
                trailing:
                    NavigationLink(destination: SettingsScene(model: SettingsSceneModel())) {
                        Image(systemName: "gearshape")
                    }
            )

        }
    }

}
