//
//  WhatsappUtils.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 29/03/22.
//

import Foundation
import UIKit

struct WhatsAppUtils {
    
    private let BaseUrl = "https://api.whatsapp.com/send"
    
    static let instance = WhatsAppUtils()
    
    func getWhatsAppURL(initialMessage: String?) -> URL? {
        var queryItems: [URLQueryItem] = []
        var urlComponents = URLComponents(string: self.BaseUrl)!
        let phoneNumber = self.getWhatsAppNumber()
        
        queryItems.append(URLQueryItem(name: "phone", value: phoneNumber))
        if let safeInitialMessage = initialMessage {
            queryItems.append(URLQueryItem(name: "text", value: safeInitialMessage))
        }
        
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
    
    private func getWhatsAppNumber() -> String {
        return "525520995011"
    }
    
    func requestBuyCourse() {
        let url = self.getWhatsAppURL(initialMessage: "Hola! \n\nQuiero adquirir el curso de Codex Betting, ¿me podrían dar la información correspondiente?")
        
        guard let url = url else {
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    func requestHelp() {
        guard let url = self.getWhatsAppURL(initialMessage: "") else {
            return
        }
        
        UIApplication.shared.open(url)
    }
}
