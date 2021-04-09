//
//  APIService.swift
//  UsingAPIs
//
//  Created by florian schweizer on 03.04.21.
//

import Combine
import Foundation

struct APIService {
    static func get<T: Decodable>(for url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                
                return element.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
