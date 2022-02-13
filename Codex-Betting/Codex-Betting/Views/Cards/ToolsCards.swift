//
//  ToolsCards.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct ToolsCards: View {
    
    @StateObject private var viewModel: ToolCardsViewModel
    
    init(viewModel: ToolCardsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 45) {
            ForEach(viewModel.toolsCards, id: \.id) { toolCard in
                InformationCardView(
                    cardTitle: toolCard.title,
                    cardImage: toolCard.image,
                    cardDescription: toolCard.description,
                    viewModel: InformationCardViewModel(
                        informationCard: toolCard
                    )
                )
            }
        }        
    }
}

struct ToolsCards_Previews: PreviewProvider {
    static var previews: some View {
        ToolsCards(
            viewModel: ToolCardsViewModel()
        )
    }
}
