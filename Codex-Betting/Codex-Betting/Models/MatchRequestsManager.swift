//
//  MatchRequestsManager.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 27/03/22.
//

import Foundation
import UIKit

protocol MatchRequestsManagerProtocol {
    func requestMatch(for selection: MatchSelection,
                      request: String?,
                      minOdd: String,
                      maxOdd: String,
                      startDate: Date,
                      endDate: Date,
                      sportbook: String)
}

final class MatchRequestsManager: MatchRequestsManagerProtocol {
    
    private let greetingText: String = "Hola, soy el cliente y quiero solicitar: "
    private let whatsappUtils: WhatsAppUtils
    
    init() {
        self.whatsappUtils = WhatsAppUtils()
    }
    
    func requestMatch(for selection: MatchSelection,
                      request: String?,
                      minOdd: String,
                      maxOdd: String,
                      startDate: Date,
                      endDate: Date,
                      sportbook: String) {
        
        var message: String = ""
        let matchProperties = RequestMatchDefaultProperties(
            minOdd: minOdd,
            maxOdd: maxOdd,
            startDate: startDate,
            endDate: endDate,
            sportbook: sportbook
        )
        
        createMessage(
            for: selection, message: &message, request: request, properties: matchProperties
        )
        
        if let url = whatsappUtils.getWhatsAppURL(initialMessage: message) {
            UIApplication.shared.open(url)
        }
        
    }
    
    private func createMessage(for selection: MatchSelection,
                               message: inout String,
                               request: String? = nil,
                               properties: RequestMatchDefaultProperties) {
        message += greetingText
        
        switch selection {
        case .match:
            message += "\n\n\(getMatchMessage(request ?? ""))"
            message += "\(getMessageWithMatchProperties(properties))"
        case .league:
            message += "\n\n\(getLeagueMessage(request ?? ""))"
            message += "\(getMessageWithMatchProperties(properties))"
        case .anyEvent:
            message += "\n\n\(getAnyEventMessage())"
            message += "\(getMessageWithMatchProperties(properties))"
        case .welcome:
            message += "\n\n\(getWelcomeMessage())"
        }
    }
    
    private func getMessageWithMatchProperties(_ properties: RequestMatchDefaultProperties) -> String {
        """
        
        
        Cuota mínima: \(properties.minOdd)

        Cuota máxima: \(properties.maxOdd)

        Desde: \(properties.startDate.localizedDescription)

        Hasta: \(properties.endDate.localizedDescription)

        Casa de apuestas: \(properties.sportbook)
        """
    }
    
    private func getWelcomeMessage() -> String {
        "Partidos para la promoción de bienvenida de Betfair"
    }
    
    private func getAnyEventMessage() -> String {
        "Cualquier evento"
    }
    
    private func getLeagueMessage(_ league: String) -> String {
        "Un partido para la liga o competición: \(league)"
    }
    
    private func getMatchMessage(_ match: String) -> String {
        "El partido: \(match)"
    }
}

struct RequestMatchDefaultProperties {
    let minOdd: String
    let maxOdd: String
    let startDate: Date
    let endDate: Date
    let sportbook: String
}
