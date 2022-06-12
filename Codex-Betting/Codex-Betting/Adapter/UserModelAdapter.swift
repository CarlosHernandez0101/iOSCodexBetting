//
//  UserModelAdapter.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/05/22.
//

import Foundation
import FirebaseAuth

class UserModelAdapter {
    
    func toDatabaseModel(_ userModel: User) -> UserDatabaseModel {
        return UserDatabaseModel(
            uid: userModel.uid, email: userModel.email ?? ""
        )
    }
    
}
