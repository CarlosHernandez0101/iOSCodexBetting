//
//  UserModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import Foundation

struct UserModel: Decodable {
    let id: String
    let email: String?
    let isCodexBettingMember: Bool?
}
