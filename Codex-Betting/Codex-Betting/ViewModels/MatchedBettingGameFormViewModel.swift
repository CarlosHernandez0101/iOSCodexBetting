//
//  MatchedBettingGameFormViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/02/22.
//

import Foundation
import SwiftUI

final class MatchedBettingGameFormViewModel: ObservableObject {
    
    @Published var isPresentedRecommendations: Bool = true
    @Published var currentMatchedBettingGameSelection: MatchSelection = .anyEvent {
        willSet {
            self.updateButtonAfterSelectionUpdate(with: newValue)
            self.setShowMatchedBettingTextField(with: newValue)
            self.setMatchedBettingGamePlaceholder(with: newValue)
            self.setShowOnlyRequestButton(with: newValue)
        }
    }
    @Published var showMatchedBettingTextField: Bool = false
    @Published var matchedBettingGameText: String = ""
    @Published var matchedBettingGamePlaceholder: String = ""
    @Published var minimumOdd: String = ""
    @Published var maximumOdd: String = ""
    @Published var gameStartDate: Date = Date()
    @Published var gameEndDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    @Published var spoortbookSelected: String = ""
    @Published var disableRequestButton: Bool = true
    @Published var showOnlyRequestButton = false
    
    private (set) var spoortbookPlaceholder: String = TextConstants.MatchedBettingGameForm.Spoortbook.selection
    
    init() {
        self.setIsPresentedRecommendations()
    }
    
    private func setIsPresentedRecommendations() {
        self.isPresentedRecommendations = UserDefaults.standard.bool(forKey: "showRecommendations")
    }
    
    private func setShowMatchedBettingTextField(with currentSelection: MatchSelection) {
        self.matchedBettingGameText = ""
        withAnimation {
            switch currentSelection {
            case .match:
                self.showMatchedBettingTextField = true
            case .league:
                self.showMatchedBettingTextField = true
            case .anyEvent:
                self.showMatchedBettingTextField = false
            case .welcome:
                self.showMatchedBettingTextField = false
            }
        }
    }
    
    private func setMatchedBettingGamePlaceholder(with currentSelection: MatchSelection) {
        self.matchedBettingGamePlaceholder = ""
        if currentSelection == .match {
            self.matchedBettingGamePlaceholder = TextConstants.MatchedBettingGameForm.PlaceholderText.match
            return
        }
        
        if currentSelection == .league {
            self.matchedBettingGamePlaceholder = TextConstants.MatchedBettingGameForm.PlaceholderText.league
            return
        }
    }
    
    private func updateButtonAfterSelectionUpdate(with currentSelection: MatchSelection) {
        self.disableRequestButton = true
        switch currentSelection {
        case .match:
            break
        case .league:
            break
        case .anyEvent:
            break
        case .welcome:
            self.disableRequestButton = false
        }
    }
    
    private func hasMatchSelectionOnMatchSelection() -> Bool {
        return false
    }
    
    private func setShowOnlyRequestButton(with currentSelection: MatchSelection) {
        withAnimation {
            switch currentSelection {
            case .match:
                self.showOnlyRequestButton = false
            case .league:
                self.showOnlyRequestButton = false
            case .anyEvent:
                self.showOnlyRequestButton = false
            case .welcome:
                self.showOnlyRequestButton = true
            }
        }
    }
    
    public func sendMessageToCodexTeam() {
        if !disableRequestButton {
            
        }
    }
    
}

