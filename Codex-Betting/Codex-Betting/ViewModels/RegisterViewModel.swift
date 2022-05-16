//
//  RegisterViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 11/05/22.
//

import Foundation
import Firebase
import FirebaseAuth

final class RegisterViewModel: ObservableObject {
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var passwordConfirmationText: String = ""
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    @Published var passwordConfirmationError: String = ""
    @Published var termsError: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var isLoadingRegister: Bool = false
    @Published var hasAcceptedTerms: Bool = false {
        didSet {
            verifyTerms()
        }
    }
    
    private let PASSWORD_LENGHT = 6
    
    private var repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
    }
    
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
        
        if isLoadingRegister {
           return
        }
        
        self.isLoadingRegister = true
        
        if emailText.isEmail && passwordText.count >= PASSWORD_LENGHT && hasAcceptedTerms {
            self.repository.createUser(email: emailText, password: passwordText)
        }
    }
    
    func didTapOnRegisterWithGoogle() {
        self.repository.signInWithGoogle()
    }
}

extension RegisterViewModel: UserRepositoryDelegate, GlobalStateInjector {
    func didCreateUser(with result: User) {
        debugPrint("USER SUCCESS GOOGLE")
        let userSession = UserSession(
            uid: result.uid ,
            email: result.email ?? ""
        )
        debugPrint("SUCCESS UID", result.uid)
        debugPrint("SUCCESS EMAIL", result.email ?? "")
        globalState.userSession.send(userSession)
        self.isLoadingRegister = false
    }
    
    func didFailCreateUser(with error: Error) {
        debugPrint("USER ERRROR GOOGLE")
        self.alertMessage = error.localizedDescription
        self.showAlert = true
    }
    
    func didSignIn(with user: User) {
        let userSession = UserSession(uid: user.uid , email: user.email ?? "")
        debugPrint("SUCCESS UID", user.uid)
        debugPrint("SUCCESS EMAIL", user.email ?? "")
        globalState.userSession.send(userSession)
    }
    
    func didFailSignIn(with error: Error) {
        self.alertMessage = error.localizedDescription
        self.showAlert = true        
    }

}
