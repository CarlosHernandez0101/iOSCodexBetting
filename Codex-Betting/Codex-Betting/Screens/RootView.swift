//
//  RootView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            
            if viewModel.showLogIn {
                LogInView(
                    viewModel: LogInViewModel(
                        repository: UserRepository(
                            auth: AuthManager(),
                            db: UserDatabase(),
                            network: UserNetwork()
                        )
                    )
                )
            } else {
                MainView(
                    viewModel: MainViewModel(
                        repository: UserRepository(
                            auth: AuthManager(),
                            db: UserDatabase(),
                            network: UserNetwork()
                        )
                    )
                )
            }
                
        }
        .preferredColorScheme(.dark)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel(repository: UserRepository(auth: AuthManager(), db: UserDatabase(), network: UserNetwork())))
    }
}
