//
//  SettingsScene.swift
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

struct SettingsScene<Model>: View where Model: SettingsSceneInterface {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject var model: Model

    var body: some View {

        Form {

            Section("네이버 API 설정") {

                TextField("Client ID", text: $model.clientId)
                TextField("Client Secret", text: $model.clientSecret)

            }

            Section("앱 정보") {

                HStack {
                    Text("버전")
                    Spacer()
                    Text(model.version)
                        .foregroundColor(Color.secondary)
                }

                HStack {
                    Button(
                        action: {

                            let url = URL(string: "https://github.com/Hyun-je/Naver_Shopping_Cart-iOS")!
                            UIApplication.shared.open(url)

                        },
                        label: {
                            Text("GitHub 저장소")
                                .foregroundColor(Color.accentColor)
                        }
                    )
                }

            }

        }
        .navigationTitle("설정")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(action: dismiss) {
                    Image(systemName: "chevron.backward")
                },
            trailing:
                EmptyView()
        )

    }

    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }

}
