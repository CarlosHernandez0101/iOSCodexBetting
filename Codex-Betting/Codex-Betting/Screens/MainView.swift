//
//  MainView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 05/02/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color.codexBlack
                
                MenuView(
                    viewModel: MenuViewModel(
                        repository: UserRepository(
                            auth: AuthManager(),
                            db: UserDatabase(),
                            network: UserNetwork()
                        )
                    )
                )
                    .padding()
                    .zIndex(1)
                
                ScrollView(showsIndicators: false) {
                    
                    MenuButton()                    
                    
                    Image(ImageConstants.codexLogo)
                        .resizable()
                        .frame(width: 250, height: 250, alignment: .center)
                    
                    if viewModel.isLoadingUserInfo {
                        DotsLoader()
                    } else {
                        InformationCards(
                            viewModel: InformationCardsViewModel()
                        )
                    }
                }
                .padding(.top, 1)
                .padding(.bottom, 32)
                
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .onAppear {
            debugPrint("MAIN ON APPEAR")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static let manager = MenuManager()
    
    static var previews: some View {
        MainView(viewModel: MainViewModel(repository: UserRepository(auth: AuthManager(), db: UserDatabase(), network: UserNetwork())))
            .environmentObject(manager)
    }
}
