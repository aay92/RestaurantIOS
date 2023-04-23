//
//  TabBar.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 22.04.2023.
//

import SwiftUI

struct TabBar: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(named: "brown")
    }
    
    var body: some View {
        TabView {
            NavigationView {
//                MenuAdminView()
            }.tabItem {
                    Image(systemName: "menucard")
                    Text("Меню")
                    
                }
        }.accentColor(Color(.white))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
