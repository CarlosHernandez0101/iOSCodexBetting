//
//  LeadingText.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LeadingText: View {
    
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.white)
                .font(
                    Font.custom(HKGrotesk.regular.rawValue,
                                size: 20
                               )
                )
            Spacer()
        }
    }
}

struct LeadingText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.codexBlack
            LeadingText(text: "1.Solicita solo partidos de fútbol")
        }
    }
}
