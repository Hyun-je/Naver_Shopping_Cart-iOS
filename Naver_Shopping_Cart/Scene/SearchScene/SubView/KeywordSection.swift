//
//  KeywordSection.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import SwiftUI

struct KeywordSection<Model>: View where Model: SearchSceneInterface {
    
    @ObservedObject var model: Model
    
    @State private var newKeyword = ""
    
    var body: some View {
        
        Section("상품 키워드") {
    
            ForEach(model.keywords, id: \.self) { item in
                Text(item)
            }
            .onDelete { indexSet in
                model.removeKeyword(at: indexSet)
            }
            
            HStack {
                Image(systemName: "plus").foregroundColor(Color.gray)
                Spacer()
                TextField("키워드 추가", text: $newKeyword)
                .onSubmit {
                    model.addKeyword(with: newKeyword)
                    newKeyword = ""
                }
                
            }
            
        }
        
        Button(action: {
            Task { await model.search() }
        }) {
            HStack {
                Spacer()
                Text("검색")
                    .foregroundColor(Color.accentColor)
                Spacer()
            }
        }
        
    }
}
