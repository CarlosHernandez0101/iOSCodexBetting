//
//  GoogleButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct GoogleButton: View {
    private let action: () -> Void
    private let buttonText: String
    
    init(action: @escaping () -> Void, buttonText: String) {
        self.action = action
        self.buttonText = buttonText
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Text(buttonText)
                    .font(Font.custom(HKGrotesk.bold.rawValue, size: 20))
                    .padding(.leading, 32)
                .padding(.vertical, 16)
                
                Image(ImageConstants.googleLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 16)
            }
        }
        .background(Color.white)
        .foregroundColor(.codexBlack)
        .cornerRadius(12)
    }
}

struct GoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.codexBlack
            
            GoogleButton(action: {}, buttonText: "Ingresar con Google")
        }
    }
}
