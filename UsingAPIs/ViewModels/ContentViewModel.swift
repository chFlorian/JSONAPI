//
//  ContentViewModel.swift
//  UsingAPIs
//
//  Created by florian schweizer on 03.04.21.
//

import Combine
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var value = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        load()
    }
    
    func load() {
        UserService
            .getUsers()
            .receive(on: RunLoop.main)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print(error)
                    return
                case .finished:
                    return
                }
            } receiveValue: { [weak self] (users) in
                self?.value = users.first!.name
            }
            .store(in: &cancellables)
    }
}
