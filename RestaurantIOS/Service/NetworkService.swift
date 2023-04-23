//
//  NetworkService.swift
//  RestaurantIOS
//
//  Created by Aleksey Alyonin on 23.04.2023.
//

import Foundation

class NetworkService {
    private init(){}
    static let shared = NetworkService()
    
    private let localhost = "http://127.0.0.1:8080"
    
    func auth(login: String, password: String) async throws -> User {
        let dto = UserDTO(login: login, password: password)
        
        guard let url = URL(string: "\(localhost)\(ApiMethod.auth.rawValue)") else {
            throw NetworkError.badURL }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let encoder = JSONEncoder()
        let data = try encoder.encode(dto)
        request.httpBody = data
        
        let userResponce = try await URLSession.shared.data(for: request)
        let userData = userResponce.0
        let decoder = JSONDecoder()
        let user = try decoder.decode(User.self, from: userData)
        
        return user
    }
    
}
///эта структура нужна для того чтобы собирать данные об авторизации и отправлять на сервер
struct UserDTO: Codable {
    let login: String
    let password: String
}

enum ApiMethod : String {
    case auth = "/users/auth"
}

enum NetworkError: Error {
    case badURL
}
