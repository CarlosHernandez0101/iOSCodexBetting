//
//  ContinueButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 20/02/22.
//

import SwiftUI

struct ContinueButton: View {
    
    private let buttonText: String
    private let action: () -> Void
    
    @Binding private var isDisabled: Bool
    
    init(buttonText: String,
         action: @escaping () -> Void,
         isDisabled: Binding<Bool>
    ) {
        self.buttonText = buttonText
        self.action = action
        self._isDisabled = isDisabled
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonText)
                .font(Font.custom(HKGrotesk.bold.rawValue, size: 20))
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
        }
        .background(Color.codexGolden)
        .foregroundColor(.white)
        .cornerRadius(12)
        .opacity(isDisabled ? 0.5 : 1)
        .disabled(isDisabled)
    }
}

struct ContinueButton_Previews: PreviewProvider {
    
    static func test() {}
    
    static var previews: some View {
        ContinueButton(
            buttonText: "Continuar",
            action: test,
            isDisabled: .constant(false)
        )
    }
}
