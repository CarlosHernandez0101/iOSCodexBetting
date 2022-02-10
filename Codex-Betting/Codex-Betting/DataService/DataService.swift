//
//  DataService.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation

final class DataService {
    
    static let instance = DataService()
    
    private let infomativeCards: [InformationCardModel] = [
        InformationCardModel(
            title: TextConstants.InformativeCards.Lessons.title,
            image: TextConstants.InformativeCards.Lessons.image,
            description: TextConstants.InformativeCards.Lessons.description,
            isEnabledByDefault: false,
            cardType: .lessons
        ),
        InformationCardModel(
            title: TextConstants.InformativeCards.Tools.title,
            image: TextConstants.InformativeCards.Tools.image,description: TextConstants.InformativeCards.Tools.description,
            isEnabledByDefault: true,
            cardType: .tools
        ),
        InformationCardModel(
            title: TextConstants.InformativeCards.Match.title,
            image: TextConstants.InformativeCards.Match.image,
            description: TextConstants.InformativeCards.Match.description,
            isEnabledByDefault: false,
            cardType: .match
        ),
        InformationCardModel(
            title: TextConstants.InformativeCards.Questions.title,
            image: TextConstants.InformativeCards.Questions.image,
            description: TextConstants.InformativeCards.Questions.description,
            isEnabledByDefault: true,
            cardType: .questions
        )
    ]
    
    func getInformationCards() -> [InformationCardModel] {
        return infomativeCards
    }
    
}
