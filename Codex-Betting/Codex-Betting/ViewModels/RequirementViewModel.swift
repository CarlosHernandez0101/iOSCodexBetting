//
//  RequirementViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 25/03/22.
//

import Foundation

final class RequirementViewModel: ObservableObject {    
    @Published var requerimentText: String
    @Published var isDone: Bool = false
    
    init(requerimentText: String) {
        self.requerimentText = requerimentText
    }
}
