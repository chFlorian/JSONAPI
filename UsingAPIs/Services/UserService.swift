//
//  UserService.swift
//  UsingAPIs
//
//  Created by florian schweizer on 05.04.21.
//

import Combine
import Foundation

struct UserService {
    static func getUsers() -> AnyPublisher<[User], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        return APIService
            .get(for: url)
    }
}
