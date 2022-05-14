//
//  MainViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var isCodexBettingMember: Bool = false
    
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
        self.getUserToken()
    }
    
    private func getUserToken() {
        
        if !tokenExists() {
            self.repository.getIDToken()
            debugPrint("USER ID INVOKED")
        }
    }
}

extension MainViewModel: UserRepositoryDelegate {
    func didGetToken(with token: String) {
        debugPrint("SUCCESS USER TOKEN", token)
        addUserToken(token)
    }
    
    func didFailGetToken(with error: Error) {
        debugPrint("GET TOKEN FAILED")
    }
}

extension MainViewModel: GlobalStateInjector {
    func addUserToken(_ token: String) {
        globalState.userSession.value?.token = token
    }
    
    func tokenExists() -> Bool {
        globalState.userSession.value?.token != nil
    }
}
