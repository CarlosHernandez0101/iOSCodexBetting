//
//  MenuView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menuManager: MenuManager
    
    private let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
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
            
            LeadingText(text: "chedezv@gmail.com")
                .padding()
            
            HStack {
                LeadingText(text: "Miembro Premium")
                    .padding()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.codexGolden)
                    .font(.system(size: 25))
            }
            
            VStack {
                MenuOptionView(title: "Buscar ayuda")
                
                MenuOptionView(title: "Política de privacidad")
                
                MenuOptionView(title: "Términos y condiciones")
                
                MenuOptionView(title: "Cerrar sesión")
                
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
        MenuView()
            .environmentObject(menuManager)
    }
}
