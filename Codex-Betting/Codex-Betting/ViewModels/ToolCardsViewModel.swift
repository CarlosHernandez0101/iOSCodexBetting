//
//  ToolCardsViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/02/22.
//

import Foundation

final class ToolCardsViewModel: ObservableObject {
    
    @Published var toolsCards: [InformationCardModel] = []
    
    init() {
        self.toolsCards = DataService.instance.getToolCards()
    }
}
