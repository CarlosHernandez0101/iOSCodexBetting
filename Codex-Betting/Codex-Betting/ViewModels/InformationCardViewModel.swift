//
//  InformationCardViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation
import UIKit
import Combine

final class InformationCardViewModel: ObservableObject, GlobalStateInjector {
        
    @Published var showLockedFeature: Bool = false
    @Published var isCodexBettingMember: Bool = false
    @Published var route: Router?
    @Published var cardType: InformationCardModel.InformationCardType
    private var cancelBag = Set<AnyCancellable>()
    
    init(informationCard: InformationCardModel) {
        self.cardType = informationCard.cardType
        self.setIsCodexBettingMember()
        self.suscribeToUserSession()
        debugPrint("SUSCRIBING TO USER")
    }
    
    private func setIsCodexBettingMember() {
        self.isCodexBettingMember = globalState.userSession.value?.isCodexBettingMember ?? false
    }
    
    public func didTapInformativeCard() {
        if isCodexBettingMember {
            didTapOnInformationCard(with: cardType)
        } else {
            showLockedFeature.toggle()
        }
    }
    
    public func didTapOnInformationCard(with type: InformationCardModel.InformationCardType) {
        switch type {
        case .lessons:
            open(.lessons)
        case .tools:
            open(.tools)
        case .match:
            open(.match)
        case .questions:
            open(.questions)
        case .calculator:
            open(.calculator)
        case .verifyBet:
            open(.verifyBet)
        case .oddConverter:
            open(.oddsConverter)
        }
    }
    
    public func open(_ route: Router) {
        self.route = route
    }
    
    public func openURLToBuyCourse() {
        WhatsAppUtils.instance.requestBuyCourse()
    }
    
    func suscribeToUserSession() {
        func subscribeToUserSession() {
            globalState.userSession.sink { [weak self] user in
                self?.isCodexBettingMember = user?.isCodexBettingMember ?? false
            }.store(in: &cancelBag)
        }
    }
}

extension InformationCardViewModel {
    enum Router {
        case lessons
        case tools
        case match
        case questions
        case calculator
        case verifyBet
        case oddsConverter
    }
}
