//
//  RecommendationListViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/02/22.
//

import Foundation

final class RecommendationListViewModel: ObservableObject {
    
    @Published var recommendations: [String] = []
    
    init() {
        self.recommendations = DataService.instance.getGameFormRecommendations()
    }    
}
