//
//  CreateGroupView.swift
//  NutriRankUI
//
//  Created by Stephane Girão Linhares on 19/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit



public struct CreateGroupView: View {

    public init() {}
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var isImagePickerDisplay2 = false
    @State private var nameGroup = ""
    @State private var descrptionGroup = ""
    @State private var rulesGroup = ""


    public var body: some View {

        GeometryReader { metrics in
                NavigationView {
                    ScrollView {
                        VStack (spacing: 40) {

                            VStack(spacing: 1) {
                                if selectedImage != nil {
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Rectangle())
                                        .scaledToFill()
                                        .frame(width: metrics.size.width * 0.92, height: metrics.size.height * 0.20)
                                        .cornerRadius(10)
                                        .containerRelativeFrame([.horizontal])
                                } else {
                                    Image(systemName: "camera.fill").font(.system(size: 37, weight: .regular))
                                        .aspectRatio(contentMode: .fit)
                                        .scaledToFill()
                                        .frame(width: metrics.size.width * 0.92, height: metrics.size.height * 0.20)
                                        .background(Color("Green"))
                                        .cornerRadius(10)
                                }

                                Button("Editar imagem") {
                                    self.isImagePickerDisplay.toggle()
                                }.padding()

                            }
                            .actionSheet(isPresented: $isImagePickerDisplay) {
                                ActionSheet(
                                    title: Text("Escolha uma opção"),
                                    buttons:[
                                        .default(
                                            Text("Câmera"),
                                            action: {
                                                self.sourceType = .camera
                                                self.isImagePickerDisplay2 = true
                                            }
                                        ),
                                        .default(
                                            Text("Galeria"),
                                            action: {
                                                self.sourceType = .photoLibrary
                                                self.isImagePickerDisplay2 = true
                                            }
                                        ),
                                        .cancel()
                                    ]
                                )
                            }
                            .sheet(isPresented: self.$isImagePickerDisplay2) {
                                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                            }

                            VStack (spacing: 20) {

                                VStack (spacing: 2) {

                                    HStack {
                                        Image(systemName: "person.2.fill")
                                        Text("Grupo")
                                        Spacer()
                                    }

                                    TextField("Nome do grupo", text: $nameGroup)
                                }

                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .frame(maxWidth: metrics.size.width * 0.92, minHeight: metrics.size.height * 0.09)
                                .background(Color("Green"))
                                .cornerRadius(10)

                                VStack (spacing: 2) {

                                    HStack {
                                        Image(systemName: "pencil")
                                        Text("Descrição")
                                        Spacer()
                                    }

                                    TextField("Descrição do grupo", text: $descrptionGroup)
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .frame(maxWidth: metrics.size.width * 0.92, minHeight: metrics.size.height * 0.09)
                                .background(Color("Green"))
                                .cornerRadius(10)

                                VStack (spacing: 2){

                                    HStack {
                                        Image(systemName: "stopwatch.fill")
                                        Text("Duração")
                                        Spacer()
                                    }

                                    TextField("Dias de duração do desafio", text: $descrptionGroup)
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .frame(maxWidth: metrics.size.width * 0.92, minHeight: metrics.size.height * 0.09)
                                .background(Color("Green"))
                                .cornerRadius(10)

                                VStack (spacing: 2){

                                    HStack {
                                        Image(systemName: "flame.fill")
                                        Text("Regras")
                                        Spacer()
                                    }

                                    TextField("Regras do grupo", text: $rulesGroup, axis: .vertical)
                                        .lineLimit(1...10)
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .frame(maxWidth: metrics.size.width * 0.92, minHeight: metrics.size.height * 0.09)
                                .background(Color("Green"))
                                .cornerRadius(10)
                            }

                            Spacer()
                        }

                    }
                    .onTapGesture {
                        self.hideKeyboard()
                    }

                    .navigationBarTitle("Criar grupo")
    //                .background(.blue)
                }
        }
        .navigationViewStyle(.stack)
    }

}


struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
