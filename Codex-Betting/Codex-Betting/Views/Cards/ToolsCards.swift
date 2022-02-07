//
//  ToolsCards.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct ToolsCards: View {
    var body: some View {
        VStack(spacing: 45) {
            InformationCardView(
                cardTitle: "Calculadora F - C",
                cardImage: "plus.forwardslash.minus",
                cardDescription: "Calculadora Favor - Contra"
            )
            
            InformationCardView(
                cardTitle: "Verificar apuesta",
                cardImage: "checkmark",
                cardDescription: "Verifica que tu apuesta sea segura"
            )
            
            InformationCardView(
                cardTitle: "Conversor de cuotas",
                cardImage: "arrow.left.arrow.right",
                cardDescription: "Convierte cuotas"
            )
        }        
    }
}

struct ToolsCards_Previews: PreviewProvider {
    static var previews: some View {
        ToolsCards()
    }
}
