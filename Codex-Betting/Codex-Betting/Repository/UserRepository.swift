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
    func didGetToken(with token: String)
    func didFailGetToken(with error: Error)
    func didUpdateUser(with user: UserModel)
    func didFailGetUser(with error: String)
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
    func didGetToken(with token: String) {
        return
    }
    func didFailGetToken(with error: Error) {
        return
    }
    func didUpdateUser(with user: UserModel) {
        return
    }
    func didFailGetUser(with error: String) {
        return
    }
}

protocol UserRepositoryProtocol {
    var delegate: UserRepositoryDelegate? { get set }
    var auth: AuthManagerProtocol { get }
    var db: UserDatabaseProtocol { get }
    var network: UserNetworkProtocol { get }
    func createUser(email: String, password: String)
    func signIn(email: String, password: String)
    func getIDToken()
    func getLastUser()
    func signOut()
    func getUser(with id: String)
}

final class UserRepository: UserRepositoryProtocol {
    weak var delegate: UserRepositoryDelegate?
    var auth: AuthManagerProtocol
    var db: UserDatabaseProtocol
    var adapter = UserModelAdapter()
    var network: UserNetworkProtocol
    
    init(auth: AuthManagerProtocol, db: UserDatabaseProtocol, network: UserNetworkProtocol) {
        self.auth = auth
        self.db = db
        self.network = network
    }
    
    func createUser(email: String, password: String) {
        self.auth.createUser(email: email, password: password) { [weak self] (result: Result<AuthDataResult, Error>) in
            
            switch result {
            case .success(let result):
                
                guard let user = self?.adapter.toDatabaseModel(result.user) else {
                    return
                }
                
                self?.db.createUser(user: user)
                
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
                
                guard let user = self?.adapter.toDatabaseModel(authResult.user) else {
                    return
                }
                debugPrint("USER MODEL", user.email)
                
                self?.db.createUser(user: user)
                
                debugPrint("USER CREATED", user.email)
                
                self?.delegate?.didSignIn(with: authResult.user)
            case .failure(let error):
                self?.delegate?.didFailSignIn(with: error)
            }
        }
    }
    
    func getIDToken() {
        self.auth.getIDToken { [weak self] (result: Result<String, Error>) in
            switch result {
            case .success(let token):
                
                guard let lastUser = self?.db.readLastStoredUser() else {
                    return
                }
                
                self?.db.updateToken(for: lastUser.uid, with: token)
                
                self?.delegate?.didGetToken(with: token)
            case .failure(let error):
                self?.delegate?.didFailGetToken(with: error)
            }
        }
    }
    
    func getLastUser() {
        
        guard let user = db.readLastStoredUser() else {
            sendUserSessionNil()
            debugPrint("No last user")
            return
        }
        
        sendUserSession(user)
        
    }
    
    func signOut() {
        self.db.deleteAllUsers()
        self.auth.signOut()
        self.sendUserSessionNil()
    }
    
    func getUser(with id: String) {
        self.network.getUser(with: id, token: getUserToken() ?? "") { user in
            
            guard let lastUser = self.db.readLastStoredUser() else {
                return
            }
            
            self.db.updateIsCodexBettingMember(for: lastUser.uid, value: user.isCodexBettingMember ?? false)
            
            self.delegate?.didUpdateUser(with: user)
        } onError: { error in
            self.delegate?.didFailGetUser(with: error)
        }

    }
}

extension UserRepository: GlobalStateInjector {
    
    func sendUserSession(_ user: UserDatabaseModel) {
        globalState.userSession.send(
            UserSession(
                uid: user.uid,
                email: user.email,
                token: user.token,
                isCodexBettingMember: user.isCodexBettingMember
            )
        )
    }
    
    func sendUserSessionNil() {
        globalState.userSession.send(nil)
    }
    
    func getUserToken() -> String? {
        globalState.userSession.value?.token
    }
}
