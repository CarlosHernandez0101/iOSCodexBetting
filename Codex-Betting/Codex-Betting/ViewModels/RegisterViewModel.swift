//
//  RegisterViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 11/05/22.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var passwordConfirmationText: String = ""
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    @Published var passwordConfirmationError: String = ""
    @Published var termsError: String = ""
    @Published var hasAcceptedTerms: Bool = false {
        didSet {
            verifyTerms()
        }
    }
    
    private let PASSWORD_LENGHT = 6
    
    func verifyEmail() {
        emailError = !emailText.isEmail ? "Ingrese un correo eléctronico válido" : ""
    }
    
    func verifyPassword() {
        passwordError = passwordText.count < PASSWORD_LENGHT ? "Debe contener al menos 6 caracteres" : ""
        verifyPasswordMatch()
    }
    
    func verifyPasswordMatch() {
        passwordConfirmationError = passwordText != passwordConfirmationText ? "Las contraseñas no coinciden" : ""
    }
    
    func verifyTerms() {
        termsError = !hasAcceptedTerms ? "Debes de aceptar los terminos y condiciones" : ""
    }
    
    func didTapOnCreateAccountButton() {
        verifyEmail()
        verifyPassword()
        verifyPasswordMatch()
        verifyTerms()
        if emailText.isEmail && passwordText.count >= PASSWORD_LENGHT && hasAcceptedTerms {
            debugPrint("Create account")
        }
    }
    
    func didTapOnRegisterWithGoogle() {
        
    }
    
}
