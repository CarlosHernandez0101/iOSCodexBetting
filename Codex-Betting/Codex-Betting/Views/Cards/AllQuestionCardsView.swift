//
//  QuestionCards.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/04/22.
//

import SwiftUI

struct AllQuestionCardsView: View {
    @StateObject private var viewModel: QuestionCardsViewModel
    
    init(viewModel: QuestionCardsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            ForEach(viewModel.questions, id: \.id) { question in
                QuestionCardView(
                    questionTitle: question.question,
                    answer: question.answer
                )
            }
        }
        .background(Color.codexBlack)
    }
}

struct QuestionCards_Previews: PreviewProvider {
    static var previews: some View {
        AllQuestionCardsView(viewModel: QuestionCardsViewModel())
    }
}
