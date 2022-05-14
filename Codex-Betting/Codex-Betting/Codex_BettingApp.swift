//
//  Codex_BettingApp.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 04/02/22.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn

@main
struct Codex_BettingApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
