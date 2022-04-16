//
//  MenuButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct MenuButton: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        menuManager.openMenu()
                    }
                }) {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                }
            }
            Spacer()
        }
        .padding(.trailing)
        .padding(.top, 50)
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.codexBlack
            MenuButton()
        }
    }
}
