//
//  BreakdownRow.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct BreakdownRow: View {
    
    private let text: String
    private let color: Color
    
    init(text: String, color: Color) {
        self.text = text
        self.color = color
    }
    
    var body: some View {
        HStack {
            Text(text)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 20
                    )
                )
            .foregroundColor(.white)
            .padding(.leading, 8)
            Spacer()
        }
        
        .background(color)
    }
}

struct BreakdownRow_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownRow(text: "Si gana", color: .codexGolden)
    }
}
