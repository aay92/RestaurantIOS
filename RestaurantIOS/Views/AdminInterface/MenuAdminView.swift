//
//  MenuAdminView.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 21.04.2023.
//

import SwiftUI

struct MenuAdminView: View {
    
    @State var showProductView = false
    
    var body: some View {
        List {
            ForEach(defProducts) { products in
                AdminProductCell(product: products)
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                           print("Delete")
                        } label: {
                          Image(systemName: "trash")
                        }.tint(.red)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            print("Edit")
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }.tint(.green)
                    }
            }
        }.listStyle(.plain)
            .navigationTitle("Menu")
            .overlay(alignment: .bottomTrailing) {
                Button {
                    showProductView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .frame(width: 50, height: 50)
                        .background(Color("brown"))
                        .clipShape(Circle())
                        .padding()
                        .foregroundColor(.white)
                }
            }.sheet(isPresented: $showProductView) {
                AdminProductView()
            }
    }
}

struct MenuAdminView_Previews: PreviewProvider {
    static var previews: some View {
        MenuAdminView()
    }
}


var defProducts = [
    Product(id: UUID().uuidString,
            title: "Food",
            price: 400,
            description: "Food description",
            imageUrl: ""),
    
    Product(id: UUID().uuidString,
            title: "Food2",
            price: 450,
            description: "Food description2",
            imageUrl: ""),
    
    Product(id: UUID().uuidString,
            title: "Food2",
            price: 450,
            description: "Food description2",
            imageUrl: "")
]

