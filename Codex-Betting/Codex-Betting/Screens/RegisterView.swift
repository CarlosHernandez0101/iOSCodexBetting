//
//  RegisterView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private let TEXT_FIELD_WIDTH = UIScreen.main.bounds.width - 120
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            CodexToolBar()
                .padding(.horizontal)
            
            Text("Crear cuenta")
                .foregroundColor(.white)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 32
                    )
            )
            
            VStack(alignment: .leading) {
                NormalText(text: "Correo eléctronico")
                
                CodexTextField(text: .constant(""), placeholder: "Ingrese su correo eléctronico", keyboardType: .emailAddress, disableAutocorrection: true, colorScheme: .light)
                    .frame(width: TEXT_FIELD_WIDTH)

                NormalText(text: "Contraseña")
                
                PasswordTextField(text: .constant(""), placeholder: "Ingrese su contraseña", colorScheme: .light)
                    .frame(width: TEXT_FIELD_WIDTH)
                
                NormalText(text: "Confirmar contraseña")
                
                PasswordTextField(text: .constant(""), placeholder: "Confirme su contraseña", colorScheme: .light)
                    .frame(width: TEXT_FIELD_WIDTH)

            }
            .padding(.top, 20)
            
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Checkbox(isSelected: .constant(true), squareSize: 25, checkmarkSize: 15)
                    
                    NormalText(text: "Aceptar ")
                    
                    UnderlinedButton(text: " Terminos y condiciones", action: {}, fontSize: 20, color: .codexGolden)
                    
                    Spacer()
                }
                .padding(.top)
                
                HStack(spacing: 0) {
                    Checkbox(isSelected: .constant(true), squareSize: 25, checkmarkSize: 15)
                    
                    NormalText(text: "Aceptar ")
                    
                    UnderlinedButton(text: " Política de privacidad", action: {}, fontSize: 20, color: .codexGolden)
                }
            }
            .padding(.leading, 60)
            .padding(.top)
            
            ContinueButton(buttonText: "Crear cuenta", action: {}, isDisabled: .constant(false))
                .padding(.top)

            NormalText(text: "O registrate con:")
                .padding(.top, 20)
            
            GoogleButton(action: {}, buttonText: "Registrarse con Google")
                .padding(.top)
            
            HStack {
                NormalText(text: "¿Ya tienes cuenta?")
                    .padding(.top, 20)
                
                UnderlinedButton(text: "Iniciar sesión", action: {
                    presentationMode.wrappedValue.dismiss()
                }, fontSize: 20, color: .white)
                .padding(.top, 20)
            }
            
            
        }
        .background(Color.codexBlack)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
