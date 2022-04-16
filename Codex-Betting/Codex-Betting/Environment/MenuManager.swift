//
//  MenuManager.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import Foundation

final class MenuManager: ObservableObject {
    @Published var showMenu = false
    
    func openMenu() {
        self.showMenu = true
    }
    
    func closeMenu() {
        self.showMenu = false
    }
}
