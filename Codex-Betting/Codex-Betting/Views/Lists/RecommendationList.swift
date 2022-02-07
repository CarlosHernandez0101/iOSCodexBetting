//
//  RecommendationList.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct RecommendationList: View {
    var body: some View {
        
        VStack(spacing: 8) {
            
            LeadingText(text: "1. Solicita partidos de fútbol")
            
            LeadingText(text: "1. Solicita partidos de fútbol")
            
            LeadingText(text: "1. Solicita partidos de fútbol")
            
            Spacer()
        }
    }
}

struct RecommendationLists_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.codexBlack
            RecommendationList()
        }
    }
}
