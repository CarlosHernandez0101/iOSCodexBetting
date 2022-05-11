//
//  RecommendationView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct RecommendationView: View {
    
    @StateObject private var viewModel: RecommendationViewModel
    @Binding private var isPresented: Bool
    
    init(viewModel: RecommendationViewModel, isPresented: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            
            HStack {
                LeadingTitle(title: TextConstants.MatchedBettingGameForm.Recommendations.title)
                    .padding(.vertical, 32)
                
                CloseButton(isPresented: $isPresented)
            }
                     
            RecommendationList(viewModel: RecommendationListViewModel())
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.horizontal, 16)
        .background(
            Color.codexBlack.edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            viewModel.disableRecommendations()
        }
    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(
            viewModel: RecommendationViewModel(),
            isPresented: .constant(true)
        )
            .previewLayout(.sizeThatFits)
    }
}
