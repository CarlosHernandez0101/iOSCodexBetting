//
//  VerifyBetViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 25/03/22.
//

import Foundation

final class VerifyBetViewModel: ObservableObject {
    
    private let currentSelection: VerifySelection
    
    @Published var showSuccessAlert: Bool = false
    @Published var requirements: [RequirementViewModel] = [] {
        willSet {
            verifyRequirements(with: newValue)
        }
    }
    
    public var alertText: String {
        switch currentSelection {
        case .bet:
            return TextConstants.VerifyBet.betAlertText
        case .deposit:
            return TextConstants.VerifyBet.depositAlertText
        }
    }
    
    init(currentSelection: VerifySelection) {
        self.currentSelection = currentSelection
        self.getRequerimentsForCurrentSelection()
    }
    
    public func getRequerimentsForCurrentSelection() {
        switch currentSelection {
        case .bet:
            initializeRequeriments(with: DataService.instance.getVerifyBetRequirements())
        case .deposit:
            initializeRequeriments(with: DataService.instance.getVerifyDepositRequirements())
        }
    }
    
    public func initializeRequeriments(with requeriments: [String]) {
        self.requirements = requeriments.map { requeriment -> RequirementViewModel in
            RequirementViewModel(requerimentText: requeriment)
        }
    }
    
    private func verifyRequirements(with requeriments: [RequirementViewModel]) {
        self.showSuccessAlert = requeriments.allSatisfy { $0.isDone }
    }
}
