//
//  QuestionDetail.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct QuestionDetail: View {
    
    private let questionTitle: String
    private let answer: String
    
    init(questionTitle: String, answer: String) {
        self.questionTitle = questionTitle
        self.answer = answer
    }
    
    var body: some View {
        ScrollView {
            CodexToolBar()
            
            VStack(alignment: .leading, spacing: 30) {
                LeadingTitle(title: questionTitle)
                
                NormalText(text: answer)
            }
            .padding()
        }
        .background(Color.codexBlack)
    }
}

struct QuestionDetail_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetail(questionTitle: "¿Cómo se gana dinero?", answer: "Con la técnica más genial")
    }
}
