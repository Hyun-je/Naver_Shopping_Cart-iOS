//
//  SearchScene.swift
//  Naver_Shopping_Cart
//
//  Created by Jaehyeon Park on 2022/01/26.
//

import SwiftUI


struct SearchScene<Model>: View where Model: SearchSceneInterface {
    
    @StateObject var model: Model
    
    @State private var newKeyword = ""
    
    
    var body: some View {
        
        NavigationView {
        
            VStack {
                
                List {
                    
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
                            TextField(text: $newKeyword, prompt: Text("키워드 추가")) {
                                
                            }
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
                    
                    
                        
                    Section("쇼핑몰 추천 결과") {
                        
                        if model.malls.count > 0 {
                        
                            ForEach(model.malls, id: \.self) { item in
                                
                                Button(action: {
   
                                }) {
                                    HStack {
                                        Text(item)
                                    }
                                }
                                
                            }
                            
                        }
                        else {
                            Text("추천 결과 없음")
                                .foregroundColor(Color.gray)
                        }
                        
                    }

                }
                

                
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

