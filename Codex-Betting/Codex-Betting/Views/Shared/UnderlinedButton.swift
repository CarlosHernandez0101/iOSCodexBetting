//
//  UnderlinedButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct UnderlinedButton: View {
    private let text: String
    private let action: () -> Void
    private let fontSize: CGFloat
    private let color: Color
    
    init(text: String,
         action: @escaping () -> Void,
         fontSize: CGFloat, color: Color) {
        self.text = text
        self.action = action
        self.fontSize = fontSize
        self.color = color
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .font(
                    Font.custom(
                        HKGrotesk.regular.rawValue,
                        size: fontSize
                    )
                )
                .foregroundColor(color)
                .underline()
        }
    }
}

struct UnderlinedButton_Previews: PreviewProvider {
    static var previews: some View {
        UnderlinedButton(text: "Regístrate", action: {}, fontSize: 20, color: .white)
    }
}
