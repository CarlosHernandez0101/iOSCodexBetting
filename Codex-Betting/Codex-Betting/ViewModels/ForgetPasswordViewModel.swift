//
//  ForgetPasswordViewModel.swift
//  Codex-Betting
//
//  Created by Casai User on 11/05/22.
//

import Foundation

final class ForgetPasswordViewModel: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var emailError: String = ""
    
    func didTapOnSendLinkButton() {
        verifyEmail()
        if emailText.isEmail {
            debugPrint("Send email")
        }
    }
    
    func verifyEmail() {
        emailError = !emailText.isEmail ? "Ingrese un correo eléctronico válido" : ""
    }
    
}
