//
//  LogInViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 11/05/22.
//

import Foundation

final class LogInViewModel: ObservableObject {
    
    @Published var textEmail: String = ""
    @Published var textPassword: String = ""
    @Published var router: Router?
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    
    private let PASSWORD_LENGHT = 6
    
    func didTapOnForgetPasswordButton() {
        self.router = .forgetPassword
    }
    
    func didTapOnLogInButton() {
        verifyEmail()
        verifyPassword()
        if textEmail.isEmail && textPassword.count >= PASSWORD_LENGHT {
            debugPrint("LOG IN")
        }
    }
    
    func didTapOnLogInWithGoogleButton() {
        
    }
    
    func didTapOnRegisterButton() {
        self.router = .register
    }
    
    func verifyEmail() {
        emailError = !textEmail.isEmail ? "Ingrese un correo eléctronico válido" : ""
    }
    
    func verifyPassword() {
        passwordError = textPassword.count < PASSWORD_LENGHT ? "Debe contener al menos 6 caracteres" : ""
    }
}

extension LogInViewModel {
    enum Router {
        case register, forgetPassword
    }
}

