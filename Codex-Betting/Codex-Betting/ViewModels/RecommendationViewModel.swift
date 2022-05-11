//
//  RecommendationViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/02/22.
//

import Foundation
import SwiftUI

final class RecommendationViewModel: ObservableObject {

    init() {
        self.disableRecommendations()
    }
    
    func disableRecommendations() {
        UserDefaults.standard.set(false, forKey: "showRecommendations")
    }
}
