//
//  AdminProductCell.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 22.04.2023.
//

import SwiftUI

struct AdminProductCell: View {
    
    var product: Product
    
    var body: some View {
        HStack{
            Image("backView")
                .resizable()
                .frame(width: 60,height: 60)
                .cornerRadius(10)
                .aspectRatio(contentMode: .fill)
                .clipShape(Rectangle())
            
            VStack(alignment: .leading, spacing: 5){
                Text(product.title)
                Text("\(product.price) руб")
            }.bold()
            Spacer()
        }
    }
}

struct AdminProductCell_Previews: PreviewProvider {
    static var previews: some View {
        AdminProductCell(product: defProducts[0])
    }
}
