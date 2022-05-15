//
//  MainViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation

final class MainViewModel: ObservableObject {
            
    private var repository: UserRepositoryProtocol
    
    @Published var isLoadingUserInfo: Bool = false
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
        self.getUserToken()
    }
    
    private func getUserToken() {
        
        if !tokenExists() {
            self.isLoadingUserInfo = true
            self.repository.getIDToken()
            debugPrint("USER ID INVOKED")
        }
    }
    
    private func getCurrentUser() {
        
        guard let userId = getCurrentUserId() else {
            debugPrint("Not found current user")
            return
        }
     
        debugPrint("CALLED GET USER")
        self.repository.getUser(with: userId)
    }
}

extension MainViewModel: UserRepositoryDelegate {
    func didGetToken(with token: String) {
        globalState.userSession.send(
            UserSession(
                uid: globalState.userSession.value?.uid ?? "",
                email: globalState.userSession.value?.email ?? "",
                token: token,
                isCodexBettingMember: globalState.userSession.value?.isCodexBettingMember ?? false
            )
        )
        getCurrentUser()
    }
    
    func didFailGetToken(with error: Error) {
        debugPrint("GET TOKEN FAILED")
    }
    
    func didUpdateUser(with user: UserModel) {        
        globalState.userSession.send(
            UserSession(
            uid: user.id,
            email: user.email ?? "",
            token: globalState.userSession.value?.token,
            isCodexBettingMember: user.isCodexBettingMember ?? false
            )
        )
        self.isLoadingUserInfo = false
    }
    
    func didFailGetUser(with error: String) {
        self.isLoadingUserInfo = false
        debugPrint("FAILED GET USER", error)
    }
}

extension MainViewModel: GlobalStateInjector {

    func tokenExists() -> Bool {
        globalState.userSession.value?.token != nil
    }
    
    func getCurrentUserId() -> String? {
        globalState.userSession.value?.uid
    }

}
