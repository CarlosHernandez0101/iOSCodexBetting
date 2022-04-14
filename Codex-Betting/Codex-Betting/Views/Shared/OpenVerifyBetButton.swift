//
//  OpenVerifyBetButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/04/22.
//

import SwiftUI

struct OpenVerifyBetButton: View {
    
    @Binding private var showVerifyBet: Bool
    
    init(showVerifyBet: Binding<Bool>) {
        self._showVerifyBet = showVerifyBet
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.showVerifyBet.toggle()
            }
        }) {
            HStack {
                LeadingText(text: "Verificar apuesta")
                
                Spacer()
                
                Image(systemName: showVerifyBet ? "chevron.up" : "chevron.down")
                    .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct OpenVerifyBetButton_Previews: PreviewProvider {
    static var previews: some View {
        OpenVerifyBetButton(showVerifyBet: .constant(false))
    }
}
