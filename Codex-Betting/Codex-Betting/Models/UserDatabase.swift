//
//  UserDatabase.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/05/22.
//

import Foundation
import RealmSwift

protocol UserDatabaseProtocol {
    func createUser(user: UserDatabaseModel)
    func readUser(with id: String) -> UserDatabaseModel?
    func readLastStoredUser() -> UserDatabaseModel?
    func updateUser(with user: UserDatabaseModel)
    func updateToken(for userId: String, with token: String)
    func updateIsCodexBettingMember(for userId: String, value: Bool)
    func deleteUser(with id: String)
    func deleteAllUsers()
}

class UserDatabase: UserDatabaseProtocol {
    
    private var realm: Realm {
        do {
            let realm = try Realm()
            return realm
        }
        catch {
            debugPrint("Could not access database: ", error.localizedDescription)
        }
        return self.realm
    }
    
    func createUser(user: UserDatabaseModel) {
        do {
            try realm.write {
                realm.add(user, update: .modified)
            }
        } catch {
            debugPrint("Error creating user", error.localizedDescription)
        }
    }
    
    func readUser(with id: String) -> UserDatabaseModel? {
        realm.object(ofType: UserDatabaseModel.self, forPrimaryKey: id)
    }
    
    func readLastStoredUser() -> UserDatabaseModel? {
        realm.objects(UserDatabaseModel.self).first
    }
    
    func updateUser(with user: UserDatabaseModel) {
        do {
            try realm.write {
                realm.add(user, update: .modified)
            }
        } catch {
            debugPrint("Error Updating User", error.localizedDescription)
        }
    }
    
    func updateToken(for userId: String, with token: String) {
        do {
            
            try realm.write {
                
                guard let user = readUser(with: userId) else {
                    debugPrint("User not found, error updating token")
                    return
                }
                
                user.token = token
                
                realm.add(user, update: .modified)
            }
            
        } catch {
            debugPrint("Error updating token", error.localizedDescription)
        }
    }
    
    func updateIsCodexBettingMember(for userId: String, value: Bool) {
        do {
            
            try realm.write {
                
                guard let user = readUser(with: userId) else {
                    debugPrint("User not found, error updating token")
                    return
                }
                
                user.isCodexBettingMember = value
                
                realm.add(user, update: .modified)
            }
            
        } catch {
            debugPrint("Error updating Codex Betting member", error.localizedDescription)
        }
    }
    
    func deleteUser(with id: String) {
        do {
            
            guard let user = self.readUser(with: id) else {
                debugPrint("User not found")
                return
            }
            
            try realm.write {
                realm.delete(user)
            }
            
        } catch {
            debugPrint("Error Deleting User", error.localizedDescription)
        }
    }
    
    func deleteAllUsers() {
        do {
            try realm.write {
                
                let users = realm.objects(UserDatabaseModel.self)
                
                realm.delete(users)
            }
        } catch {
            debugPrint("Error deleting all users", error.localizedDescription)
        }
    }
}
