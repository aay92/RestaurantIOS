//
//  AdminProductView.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 22.04.2023.
//

import SwiftUI

struct AdminProductView: View {
    
    @State var title: String = ""
    @State var prace: Int = 0
    @State var category: Category = .first
    @State var description: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "camera")
                .resizable()
                .frame(width: 220, height: 180)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black.opacity(0.8))
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

