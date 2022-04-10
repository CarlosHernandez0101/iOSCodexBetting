//
//  CodexTextField.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 18/02/22.
//

import SwiftUI

struct CodexTextField: View {
    
    @Binding private var text: String
    
    private let placeholder: String
    private let keyboardType: UIKeyboardType
    private let disableAutocorrection: Bool
    private let colorScheme: ColorScheme
    
    init(text: Binding<String>,
         placeholder: String,
         keyboardType: UIKeyboardType,
         disableAutocorrection: Bool,
         colorScheme: ColorScheme
    ) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.disableAutocorrection = disableAutocorrection
        self.colorScheme = colorScheme
    }
    
    var body: some View {
        
        TextField(placeholder, text: $text, onEditingChanged: { isEditing in
            debugPrint("Editing")
        }) {
            UIApplication.shared.endEditing()
            debugPrint("Action")
        }
        .colorScheme(colorScheme)
        .textFieldStyle(.roundedBorder)
        .disableAutocorrection(self.disableAutocorrection)
        .keyboardType(self.keyboardType)
        
    }
}

struct CodexTextField_Previews: PreviewProvider {
    static var previews: some View {
        CodexTextField(text: .constant(""), placeholder: "Ingrese una cantidad", keyboardType: .default, disableAutocorrection: true, colorScheme: .light)
            .previewLayout(.sizeThatFits)
        
        CodexTextField(text: .constant(""), placeholder: "Ingrese una cantidad", keyboardType: .default, disableAutocorrection: true, colorScheme: .dark)
            .previewLayout(.sizeThatFits)
    }
}
