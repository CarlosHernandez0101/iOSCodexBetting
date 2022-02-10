//
//  RecommendationView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct RecommendationView: View {
    
    @Binding private var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            
            HStack {
                LeadingTitle(title: "Recomendaciones")
                    .padding(.vertical, 32)
                
                CloseButton(isPresented: $isPresented)
            }
                     
            RecommendationList()
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.horizontal, 16)
        .background(
            Color.codexBlack.edgesIgnoringSafeArea(.all)
        )
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
