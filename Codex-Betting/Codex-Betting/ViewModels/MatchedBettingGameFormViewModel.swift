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
    @Published var matchedBettingGameText: String = "" {
        didSet {
            updateButton()
        }
    }
    @Published var matchedBettingGamePlaceholder: String = ""
    @Published var minimumOdd: String = "" {
        didSet {
            updateButton()
        }
    }
    @Published var maximumOdd: String = "" {
        didSet {
            updateButton()
        }
    }
    @Published var gameStartDate: Date = Date() {
        didSet {
            updateButton()
        }
    }
    @Published var gameEndDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())! {
        didSet {
            updateButton()
        }
    }
    @Published var sportbookSelected: String = "" {
        didSet {
            updateButton()
        }
    }
    @Published var disableRequestButton: Bool = true
    @Published var showOnlyRequestButton = false
    
    private (set) var spoortbookPlaceholder: String = TextConstants.MatchedBettingGameForm.Spoortbook.selection
    
    private var requestsManager: MatchRequestsManagerProtocol
    
    init(requestsManager: MatchRequestsManagerProtocol) {
        self.requestsManager = requestsManager
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
        if currentSelection == .welcome { self.disableRequestButton = false }
    }
    
    private func updateButton() {
        
        if currentMatchedBettingGameSelection != .welcome {
            
            guard !minimumOdd.isEmpty && !maximumOdd.isEmpty && !sportbookSelected.isEmpty else {
                return
            }
            
            if currentMatchedBettingGameSelection == .anyEvent {
                self.disableRequestButton = false
                return
            } else {
                guard !matchedBettingGameText.isEmpty else {
                    return
                }
                
                self.disableRequestButton = false
            }
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
            switch currentMatchedBettingGameSelection {
            case .match:
                requestsManager.requestMatch(
                    for: currentMatchedBettingGameSelection,
                       request: matchedBettingGameText,
                       minOdd: minimumOdd,
                       maxOdd: maximumOdd,
                       startDate: gameStartDate,
                       endDate: gameEndDate,
                       sportbook: sportbookSelected
                )
            case .league:
                requestsManager.requestMatch(
                    for: currentMatchedBettingGameSelection,
                       request: matchedBettingGameText,
                       minOdd: minimumOdd,
                       maxOdd: maximumOdd,
                       startDate: gameStartDate,
                       endDate: gameEndDate,
                       sportbook: sportbookSelected
                )
            case .anyEvent:
                requestsManager.requestMatch(
                    for: currentMatchedBettingGameSelection,
                       request: nil,
                       minOdd: minimumOdd,
                       maxOdd: maximumOdd,
                       startDate: gameStartDate,
                       endDate: gameEndDate,
                       sportbook: sportbookSelected
                )
            case .welcome:
                requestsManager.requestMatch(
                    for: currentMatchedBettingGameSelection,
                       request: nil,
                       minOdd: minimumOdd,
                       maxOdd: maximumOdd,
                       startDate: gameStartDate,
                       endDate: gameEndDate,
                       sportbook: sportbookSelected
                )
            }
        }
    }
    
}

