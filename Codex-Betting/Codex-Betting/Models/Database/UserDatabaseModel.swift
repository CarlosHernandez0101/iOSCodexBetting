//
//  UserDatabaseModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/05/22.
//

import Foundation
import RealmSwift

class UserDatabaseModel: Object {
    
    override static func primaryKey() -> String {
        return "uid"
    }
    
    @objc dynamic var uid: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var token: String = ""
    @objc dynamic var isCodexBettingMember: Bool = false
    
    convenience init(uid: String, email: String) {
        self.init()
        self.uid = uid
        self.email = email
    }
    
}
