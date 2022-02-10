//
//  InformationCards.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 05/02/22.
//

import SwiftUI

struct InformationCards: View {
    var body: some View {
        VStack(spacing: 45) {
            
            InformationCardView(
                cardTitle: "Lecciones",
                cardImage: "book",
                cardDescription: "Aquí encontrarás todas las lecciones del curso"
            )
            
            InformationCardView(
                cardTitle: "Herramientas",
                cardImage: "hammer",
                cardDescription: "Aquí encontrarás todas las herramientas del curso"
            )
            
            InformationCardView(
                cardTitle: "Solicitar partido",
                cardImage: "sportscourt",
                cardDescription: "Solicita un partido a nuestro equipo"
            )
        }
        .padding(.horizontal)
    }
}

struct InformationCards_Previews: PreviewProvider {
    static var previews: some View {
        InformationCards()
    }
}
