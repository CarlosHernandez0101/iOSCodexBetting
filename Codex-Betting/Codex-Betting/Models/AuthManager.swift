//
//  AuthManager.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 12/05/22.
//

import Foundation
import FirebaseAuth

protocol AuthManagerProtocol {
    func createUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func getIDToken(completion: @escaping (Result<String, Error>) -> Void)
    func signOut()
}


final class AuthManager: AuthManagerProtocol {
    
    init() {
        Auth.auth().languageCode = "es"
    }
    
    
    func createUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let result = result else {
                return
            }
            
            completion(.success(result))
            
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
         
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let authResult = authResult else {
                return
            }
            
            completion(.success(authResult))            
        }
    }
    
    func getIDToken(completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().currentUser?.getIDTokenResult(completion: { result, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let result = result else {
                debugPrint("User token nil")
                return
            }
            
            completion(.success(result.token))
        })
        
    }
    
    func signOut() {
        do {
             try Auth.auth().signOut()
            
        } catch {
             debugPrint("Sign Out Error", error.localizedDescription)
        }
    }
}
