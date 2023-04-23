//
//  User.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 23.04.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let login: String
    let role: String
}
