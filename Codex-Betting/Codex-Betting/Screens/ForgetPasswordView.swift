//
//  ForgetPasswordView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct ForgetPasswordView: View {
    var body: some View {
        ScrollView {
            CodexToolBar()
            
            VStack(alignment: .leading, spacing: 25) {
                LeadingTitle(title: "Restablecer contraseña")
                
                NormalText(text: "Escribe la dirección de correo relacionada con tu cuenta y nosotros enviaremos un enlace para que restablezcas tu constraseña.")
                
                CodexTextField(text: .constant(""), placeholder: "Ingresa tu correo eléctronico", keyboardType: .emailAddress, disableAutocorrection: true, colorScheme: .light)

            }
            
            ContinueButton(buttonText: "Enviar", action: {}, isDisabled: .constant(false))
        }
        .padding(.horizontal)
        .background(Color.codexBlack)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
