//
//  ContentView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 04/02/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showRecommendations") var showRecommendations = true
    
    private let menuManager: MenuManager = MenuManager()
    
    var body: some View {
        RootView(
            viewModel: RootViewModel(
                repository: UserRepository(
                    auth: AuthManager(),
                    db: UserDatabase(),
                    network: UserNetwork()
                )
            )
        )
            .preferredColorScheme(.dark)
            .environmentObject(menuManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
