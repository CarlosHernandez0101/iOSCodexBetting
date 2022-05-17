//
//  ForgetPasswordViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 11/05/22.
//

import Foundation

final class ForgetPasswordViewModel: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var emailError: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func didTapOnSendLinkButton() {
        verifyEmail()
        if emailText.isEmail {
            self.repository.sendPasswordReset(with: emailText)
        }
    }
    
    func verifyEmail() {
        emailError = !emailText.isEmail ? "Ingrese un correo eléctronico válido" : ""
    }
    
}

extension ForgetPasswordViewModel: UserRepositoryDelegate {
    func didSendPasswordReset() {
        self.showAlert = true
        self.alertMessage = "Envíamos un correo para cambiar su contraseña"
    }
    
    func didFailPasswordReset(with error: String) {
        self.showAlert = true
        self.alertMessage = "Ocurrió un error: \(error)"
        
    }
}
