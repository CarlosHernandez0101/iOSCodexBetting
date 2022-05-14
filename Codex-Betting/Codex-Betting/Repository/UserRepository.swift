//
//  UserRepository.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/05/22.
//

import Foundation
import FirebaseAuth
import Firebase

protocol UserRepositoryDelegate: AnyObject{
    func didCreateUser(with result: User)
    func didFailCreateUser(with error: Error)
    func didSignIn(with user: User)
    func didFailSignIn(with error: Error)
}

extension UserRepositoryDelegate {
    func didFailCreateUser(with error: Error) {
        return
    }
    func didFailSignIn(with error: Error) {
        return
    }
    func didSignIn(with user: User) {
        return
    }
    func didCreateUser(with result: User) {
        return
    }
}

protocol UserRepositoryProtocol {
    var delegate: UserRepositoryDelegate? { get set }
    var auth: AuthManagerProtocol { get }
    func createUser(email: String, password: String)
    func signIn(email: String, password: String)
}

final class UserRepository: UserRepositoryProtocol {
    weak var delegate: UserRepositoryDelegate?
    var auth: AuthManagerProtocol
    
    init(auth: AuthManagerProtocol) {
        self.auth = auth
    }
    
    func createUser(email: String, password: String) {
        self.auth.createUser(email: email, password: password) { [weak self] (result: Result<AuthDataResult, Error>) in
            
            switch result {
            case .success(let result):                
                self?.delegate?.didCreateUser(with: result.user)
            case .failure(let error):
                self?.delegate?.didFailCreateUser(with: error)
            }
        }
    }
    
    func signIn(email: String, password: String) {
        self.auth.signIn(email: email, password: password) { [weak self] (result: Result<AuthDataResult, Error>) in
                        
            switch result {
            case .success(let authResult):
                self?.delegate?.didSignIn(with: authResult.user)
            case .failure(let error):
                self?.delegate?.didFailSignIn(with: error)
            }
        }
    }    
}

