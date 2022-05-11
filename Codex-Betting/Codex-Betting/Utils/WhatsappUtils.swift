//
//  WhatsappUtils.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 29/03/22.
//

import Foundation

struct WhatsAppUtils {
    
    private let BaseUrl = "https://api.whatsapp.com/send"
    
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
}
