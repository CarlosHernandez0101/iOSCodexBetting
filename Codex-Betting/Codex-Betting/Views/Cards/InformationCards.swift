//
//  InformationCards.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 05/02/22.
//

import SwiftUI

struct InformationCards: View {
        
    @StateObject private var viewModel: InformationCardsViewModel    
    
    init(viewModel: InformationCardsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 45) {
            ForEach(viewModel.informationCards, id: \.id) { informationCard in
                
                InformationCardView(
                    cardTitle: informationCard.title,
                    cardImage: informationCard.image,
                    cardDescription: informationCard.description,
                    viewModel: InformationCardViewModel(
                        informationCard: informationCard
                    )
                )
                
            }
        }
        .padding(.horizontal)
    }
}

struct InformationCards_Previews: PreviewProvider {
    static var previews: some View {
        InformationCards(
            viewModel: InformationCardsViewModel())
    }
}
