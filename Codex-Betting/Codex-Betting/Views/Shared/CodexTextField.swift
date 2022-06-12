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
    private let onCommit: () -> Void
    
    init(text: Binding<String>,
         placeholder: String,
         keyboardType: UIKeyboardType,
         disableAutocorrection: Bool,
         colorScheme: ColorScheme,
         onCommit: @escaping () -> Void = {}
    ) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.disableAutocorrection = disableAutocorrection
        self.colorScheme = colorScheme
        self.onCommit = onCommit
    }
    
    var body: some View {
        
        TextField(placeholder, text: $text, onEditingChanged: { isEditing in
            
        }) {
            UIApplication.shared.endEditing()
            onCommit()            
        }
        .colorScheme(colorScheme)
        .textFieldStyle(.roundedBorder)
        .disableAutocorrection(self.disableAutocorrection)
        .keyboardType(self.keyboardType)
    }
}

struct PasswordTextField: View {
    
    @Binding private var text: String
    
    @State private var showPassword: Bool = false
    
    private let placeholder: String
    private let colorScheme: ColorScheme
    private let onCommit: () -> Void
    
    init(text: Binding<String>,
         placeholder: String,
         colorScheme: ColorScheme,
         onCommit: @escaping () -> Void = {}) {
        self._text = text
        
        self.colorScheme = colorScheme
        self.placeholder = placeholder
        self.onCommit = onCommit
    }
    
    var body: some View {
        ZStack {
            
            if showPassword {
                
                CodexTextField(
                    text: $text, placeholder: placeholder, keyboardType: .default, disableAutocorrection: true, colorScheme: colorScheme, onCommit: onCommit)
                
                
            } else {
                SecureField(placeholder, text: $text, onCommit: {
                    onCommit()
                })
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
                    .colorScheme(colorScheme)
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                        .padding(.horizontal)
                        .foregroundColor(.codexBlack)
                }
            }
        }
    }
}

struct CodexTextField_Previews: PreviewProvider {
    static var previews: some View {
        
        CodexTextField(text: .constant(""), placeholder: "Ingrese una cantidad", keyboardType: .default, disableAutocorrection: true, colorScheme: .light)
            .previewLayout(.sizeThatFits)
        
        
        CodexTextField(text: .constant(""), placeholder: "Ingrese una cantidad", keyboardType: .default, disableAutocorrection: true, colorScheme: .dark)
            .previewLayout(.sizeThatFits)
        
        PasswordTextField(text: .constant(""), placeholder: "Contraseña", colorScheme: .light)
            .previewLayout(.sizeThatFits)
    }
}
