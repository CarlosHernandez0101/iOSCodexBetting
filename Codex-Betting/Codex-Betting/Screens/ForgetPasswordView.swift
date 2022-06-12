//
//  ForgetPasswordView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct ForgetPasswordView: View {
    @StateObject private var viewModel: ForgetPasswordViewModel
    
    init(viewModel: ForgetPasswordViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            CodexToolBar()
            
            VStack(alignment: .leading, spacing: 25) {
                LeadingTitle(title: "Restablecer contraseña")
                
                NormalText(text: "Escribe la dirección de correo relacionada con tu cuenta y nosotros enviaremos un enlace para que restablezcas tu constraseña.")
                
                
                CodexTextField(text: $viewModel.emailText, placeholder: "Ingresa tu correo eléctronico", keyboardType: .emailAddress, disableAutocorrection: true, colorScheme: .light, onCommit: viewModel.verifyEmail)
                
                if !viewModel.emailError.isEmpty {
                    Text(viewModel.emailError)
                        .foregroundColor(.red)
                }
                
            }
            
            ContinueButton(buttonText: "Enviar", action: {
                viewModel.didTapOnSendLinkButton()
            }, isDisabled: .constant(false))
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(""), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Aceptar")))
        })
        .padding(.horizontal)
        .background(Color.codexBlack)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView(viewModel: ForgetPasswordViewModel(repository: UserRepository(auth: AuthManager(), db: UserDatabase(), network: UserNetwork())))
    }
}
