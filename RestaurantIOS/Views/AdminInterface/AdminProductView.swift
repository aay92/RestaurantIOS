//
//  AdminProductView.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 22.04.2023.
//

import SwiftUI
import PhotosUI

struct AdminProductView: View {
    
    @State var title: String = ""
    @State var prace: Int?
    @State var category: Category = .first
    @State var description: String = ""
    @State var selectedItem: PhotosPickerItem?
    @State var data: Data?
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $selectedItem) {
                if let data {
                    Image(uiImage: UIImage(data: data)!)
                        .resizable()
                        .frame(width: 220, height: 180)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black.opacity(0.8))
                        .cornerRadius(20)
                } else {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 220, height: 180)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black.opacity(0.8))
                }
            }.onChange(of: selectedItem) { newValue in
                guard let selectedItem else { return }
                selectedItem.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let success):
                        if let success {self.data = success }
                    case .failure(let failure):
                        print("Data not found \(failure)")
                    }
                }
            }
            
            TextField("Название", text: $title)
                .padding().background(.white)
                .padding(.horizontal)
            TextField("Цена", value: $prace, format: .number)
                .padding().background(.white)
                .padding(.horizontal)
            Picker("Категория", selection: $category) {
                ForEach(Category.allCases, id: \.rawValue) { category in
                    Text(category.rawValue)
                        .tag(category)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(10).background(.white)
            .padding(.horizontal)
            .tint(.black)
            
            TextField("Описание", text: $description)
                .padding().background(.white)
                .padding(.horizontal)
            
            Button {
                print("Create")
            } label: {
                Text("Create")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("brown"))
                    .padding()
                    .foregroundColor(.white)
                    .font(.title3).bold()
            }
        }.frame(maxHeight: .infinity)
            .background(Color(.gray.withAlphaComponent(0.2)))
    }
}

struct AdminProductView_Previews: PreviewProvider {
    static var previews: some View {
        AdminProductView()
    }
}

enum Category: String, CaseIterable {
    case first = "Первые блюда"
    case second = "Вторые блюда"
    case drinks = "Напитки"
    case desert = "Десерты"
    case salat = "Салаты"
}

