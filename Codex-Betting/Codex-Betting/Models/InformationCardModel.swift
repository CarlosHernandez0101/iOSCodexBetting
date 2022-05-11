//
//  InformationCardModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation

struct InformationCardModel: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let description: String
    let isEnabledByDefault: Bool
    let cardType: InformationCardType
    
    public enum InformationCardType {
        case lessons
        case tools
        case match
        case questions
        case calculator
        case verifyBet
        case oddConverter
    }
}
