//
//  RootView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct RootView: View {
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

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
