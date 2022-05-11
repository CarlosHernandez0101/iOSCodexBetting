//
//  RecommendationList.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct RecommendationList: View {
    
    @StateObject private var viewModel: RecommendationListViewModel
    
    init(viewModel: RecommendationListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            ForEach(0..<viewModel.recommendations.count, id: \.self) { index in
                LeadingText(text: viewModel.recommendations[index])
            }
            
            Spacer()
        }
    }
}

struct RecommendationLists_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.codexBlack
            RecommendationList(viewModel: RecommendationListViewModel())
        }
    }
}
