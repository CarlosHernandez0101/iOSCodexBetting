//
//  MenuViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/05/22.
//

import Foundation
import Combine

final class MenuViewModel: ObservableObject {
    
    @Published var userEmail: String?
    @Published var isCodexBettingMember: Bool?
    private var cancelBag = Set<AnyCancellable>()
    
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
        self.setUserInfo()
    }
    
    private func setUserInfo() {
        self.setUserEmail()
        self.setIsCodexBettingMember()
        self.subscribeToUserSession()
    }
    
    func didTapOnHelp() {
        WhatsAppUtils.instance.requestHelp()
    }
    
    func didTapOnBuyCourse() {
        WhatsAppUtils.instance.requestBuyCourse()
    }
    
    func didTapOnSignOut() {
        self.repository.signOut()
    }
}

extension MenuViewModel: GlobalStateInjector {
    private func setUserEmail() {
        self.userEmail = globalState.userSession.value?.email
    }
    
    private func setIsCodexBettingMember() {
        self.isCodexBettingMember = globalState.userSession.value?.isCodexBettingMember
    }
    
    func subscribeToUserSession() {
        globalState.userSession.sink { [weak self] user in
            self?.userEmail = user?.email
            self?.isCodexBettingMember = user?.isCodexBettingMember
        }.store(in: &cancelBag)
    }
}
