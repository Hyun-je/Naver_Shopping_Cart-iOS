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
                
                SearchResultSection(model: model)

            }
            .navigationTitle("🛒 네이버 쇼핑 카트")
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

