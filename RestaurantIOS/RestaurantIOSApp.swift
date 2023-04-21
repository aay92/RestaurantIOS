//
//  RestaurantIOSApp.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 21.04.2023.
//

import SwiftUI

@main
struct RestaurantIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
