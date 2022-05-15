//
//  RootViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/05/22.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    
    @Published var showLogIn: Bool = true
    
    private var cancelBag = Set<AnyCancellable>()
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
        self.subscribeToUserSession()
        self.initializeUserSession()
    }
    
    private func initializeUserSession() {
        self.repository.getLastUser()
    }
}

extension RootViewModel: GlobalStateInjector {
    func subscribeToUserSession() {
        globalState.userSession.sink { [weak self] user in
            self?.showLogIn = user == nil
        }.store(in: &cancelBag)
    }
}
