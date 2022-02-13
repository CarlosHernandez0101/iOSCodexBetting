//
//  InformationCardViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation
import UIKit

final class InformationCardViewModel: ObservableObject {
    
    @Published var isEnabled: Bool = false
    @Published var showLockedFeature: Bool = false
    @Published var isCodexBettingMember: Bool = true
    @Published var route: Router?
    @Published var cardType: InformationCardModel.InformationCardType
    
    init(informationCard: InformationCardModel) {
        self.isEnabled = informationCard.isEnabledByDefault
        self.cardType = informationCard.cardType
    }
    
    public func didTapInformativeCard() {
        if isEnabled || isCodexBettingMember {
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
        }
    }
    
    public func open(_ route: Router) {
        self.route = route
    }
    
    public func openURLToBuyCourse() {
        if let url = URL(string: "https://www.youtube.com/watch?v=q52YORZ3lrc") {
            UIApplication.shared.open(url)
        }
    }
}

extension InformationCardViewModel {
    enum Router {
        case lessons
        case tools
        case match
        case questions
    }
}
