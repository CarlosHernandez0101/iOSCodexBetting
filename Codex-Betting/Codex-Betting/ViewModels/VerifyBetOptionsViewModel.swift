//
//  VerifyBetOptionsViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 25/03/22.
//

import Foundation

final class VerifyBetOptionsViewModel: ObservableObject {
    
    @Published var currenVerifySelection: VerifySelection = .bet
    @Published var presentVerify: Bool = false
    
    public func goToVerify() {
        self.presentVerify = true
    }
}
