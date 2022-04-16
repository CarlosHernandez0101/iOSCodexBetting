//
//  ContentView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 04/02/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("showRecommendations") var showRecommendations = true
    
    @State var showLogIn: Bool = true
    
    var body: some View {
        
        ZStack {
            
            if showLogIn {
                LogInView(showLogin: $showLogIn)
            } else {
                MainView(viewModel: MainViewModel())
            }
                
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
