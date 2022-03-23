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
    
    private let toolsCards: [InformationCardModel] = [
        InformationCardModel(
            title: TextConstants.InformativeCards.Calculator.title,
            image: TextConstants.InformativeCards.Calculator.image,
            description: TextConstants.InformativeCards.Calculator.description,
            isEnabledByDefault: false,
            cardType: .calculator
        ),
        InformationCardModel(
            title: TextConstants.InformativeCards.VerifyBet.title,
            image: TextConstants.InformativeCards.VerifyBet.image,
            description: TextConstants.InformativeCards.VerifyBet.description,
            isEnabledByDefault: false,
            cardType: .verifyBet
        ),
        InformationCardModel(
            title: TextConstants.InformativeCards.OddsConverter.title,
            image: TextConstants.InformativeCards.OddsConverter.image,
            description: TextConstants.InformativeCards.OddsConverter.description,
            isEnabledByDefault: false,
            cardType: .oddConverter
        )
    ]
    
    private let gameFormRecommendations: [String] = [
        "1. Esta herramienta solo acepta partidos de fútbol, cualquier otro deporte no será tomado en cuenta",
        "2. Solicita el partido con anticipación",
        "3. Verifica que las fechas en las que solicitas un partido sean correctas",
        "4. Solicita solamente los partidos que necesites, el exceso de peticiones o mal uso de la herramienta puede resultar en la inhabilitación de la misma",
        "5. Si no recibes respuesta en un lapso de 3 horas por parte de nuestro equipo manda un mensaje de nuevo"
    ]
    
    func getInformationCards() -> [InformationCardModel] {
        return infomativeCards
    }
    
    func getToolCards() -> [InformationCardModel] {
        return toolsCards
    }
    
    func getGameFormRecommendations() -> [String] {
        return gameFormRecommendations
    }
    
}
