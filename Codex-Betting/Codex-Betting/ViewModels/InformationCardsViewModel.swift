//
//  InformationCardsViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation

final class InformationCardsViewModel: ObservableObject {
        
    @Published var informationCards: [InformationCardModel] = []
    
    init() {
        informationCards = DataService.instance.getInformationCards()
    }
    
}
