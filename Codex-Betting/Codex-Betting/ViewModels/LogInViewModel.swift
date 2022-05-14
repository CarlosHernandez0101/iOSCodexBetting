//
//  LogInViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 11/05/22.
//

import Foundation
import Firebase
import FirebaseAuth

final class LogInViewModel: ObservableObject {
    
    @Published var textEmail: String = ""
    @Published var textPassword: String = ""
    @Published var router: Router?
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var isLoadingLogIn: Bool = false
    
    private let PASSWORD_LENGHT = 6
    
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func didTapOnForgetPasswordButton() {
        self.router = .forgetPassword
    }
    
    func didTapOnLogInButton() {
        verifyEmail()
        verifyPassword()
        
        if isLoadingLogIn {
            return
        }
        
        self.isLoadingLogIn = true
        
        if textEmail.isEmail && textPassword.count >= PASSWORD_LENGHT {
//            self.repository.signIn(email: textEmail, password: textPassword)
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

extension LogInViewModel: UserRepositoryDelegate, GlobalStateInjector {
    
    func didSignIn(with user: User) {
        let userSession = UserSession(uid: user.uid , email: user.email ?? "")
        debugPrint("SUCCESS UID", user.uid)
        debugPrint("SUCCESS EMAIL", user.email ?? "")
        globalState.userSession.send(userSession)
        self.isLoadingLogIn = false
    }
    
    func didFailSignIn(with error: Error) {
        self.alertMessage = error.localizedDescription
        self.showAlert = true
        self.isLoadingLogIn = false
    }
}

extension LogInViewModel {
    enum Router {
        case register, forgetPassword
    }
}

