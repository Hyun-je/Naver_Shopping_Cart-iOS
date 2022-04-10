//
//  SearchResultSection.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import SwiftUI

protocol SearchResultSectionInterface: ObservableObject {

    var malls: [String] { get }
    var prices: [String] { get }

}

struct SearchResultSection<Model>: View where Model: SearchResultSectionInterface {

    @ObservedObject var model: Model

    var body: some View {

        Section("쇼핑몰 추천 결과") {

            if model.malls.count > 0 {

                ForEach(model.malls, id: \.self) { item in

                    Button(action: {

                    }, label: {
                        HStack {
                            Text(item)
                        }
                    })

                }

            } else {
                Text("추천 결과 없음")
                    .foregroundColor(Color.gray)
            }

        }

    }

}
