//
//  QuestionsView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/04/22.
//

import SwiftUI

struct QuestionsView: View {
    var body: some View {
        ZStack {
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                
                LeadingTitle(title: TextConstants.Questions.title)
                
                AllQuestionCardsView(viewModel: QuestionCardsViewModel())
                
            }
            .padding(.top, 1)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .background(
            Color.codexBlack.edgesIgnoringSafeArea(.all)
        )
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}
