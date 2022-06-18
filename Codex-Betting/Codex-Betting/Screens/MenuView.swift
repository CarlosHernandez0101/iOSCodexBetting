//
//  MenuView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menuManager: MenuManager
    
    @StateObject private var viewModel: MenuViewModel
    @State private var goToTerms: Bool = false
    @State private var goToDeleteAccount: Bool = false
    
    init(viewModel: MenuViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    private let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            NavigationLink(
                isActive: $goToTerms) {
                    LegalView()
                } label: {
                    EmptyView()
                }
            
            NavigationLink(
                isActive: $goToDeleteAccount) {
                    LegalView()
                } label: {
                    EmptyView()
                }
            
            HStack {
                LeadingTitle(title: "Menú")
                
                Button(action: {
                    withAnimation {
                        menuManager.closeMenu()
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
            }
            
            LeadingText(text: "Usuario:")
                .padding()
            
            LeadingText(text: viewModel.userEmail ?? "")
                .padding()
            
            if viewModel.isCodexBettingMember ?? false {
                HStack {
                    LeadingText(text: "Miembro Premium")
                        .padding()
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.codexGolden)
                        .font(.system(size: 25))
                }
            } else {
                HStack {
                    UnderlinedButton(text: "Comprar curso", action: {
                        viewModel.didTapOnBuyCourse()
                    }, fontSize: 20, color: .white)
                    
                    Spacer()
                }
                .padding(.leading)
            }
            
            VStack {
                MenuOptionView(title: "Buscar ayuda", action: {
                    viewModel.didTapOnHelp()
                })
                
                MenuOptionView(title: "Política de privacidad y T & C", action: {
                    self.goToTerms = true
                })
                
                MenuOptionView(title: "Borrar cuenta", action: {
                    goToDeleteAccount = true
                })
                
                MenuOptionView(title: "Cerrar sesión", action: {
                    withAnimation {
                        viewModel.didTapOnSignOut()
                    }
                    menuManager.closeMenu()
                })
                
                CustomDivider(dividerColor: .codexGray)
            }
            .padding(.top, 64)
            
            Spacer()
            
            NormalText(text: "Versión 1.0.0")
                .padding(.bottom)
            
        }
        .padding(.horizontal)
        .padding(.top, 32)
        .background(Color.codexBlack)
        .offset(x: menuManager.showMenu ? 0 : +SCREEN_WIDTH)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct MenuView_Previews: PreviewProvider {
    static let menuManager = MenuManager()
    
    static var previews: some View {
        MenuView(viewModel: MenuViewModel(repository: UserRepository(auth: AuthManager(), db: UserDatabase(), network: UserNetwork())))
            .environmentObject(menuManager)
            .onAppear {
                menuManager.openMenu()
            }
    }
}
