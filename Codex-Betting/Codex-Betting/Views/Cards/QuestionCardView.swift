//
//  QuestionCardView.swift
//  Codex-Betting
//
//  Created by Casai User on 14/04/22.
//

import SwiftUI

struct QuestionCardView: View {
    
    @State private var showQuestionDetail = false
    
    private let questionTitle: String
    private let answer: String
    
    init(questionTitle: String, answer: String) {
        self.questionTitle = questionTitle
        self.answer = answer
    }
    
    var body: some View {
       VStack {
            
            NavigationLink(
                isActive: $showQuestionDetail) {
                    QuestionDetail(questionTitle: questionTitle, answer: answer
                    )                        
                } label: {
                    EmptyView()
                }

            
            HStack {
                
                Text(questionTitle)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            HStack {
                Text(answer)
                    .foregroundColor(.codexGray)
                    .padding(.top, 8)
                .lineLimit(3)
                
                Spacer()
            }
            
            CustomDivider(dividerColor: .codexGray)
                .padding(.top, 16)
            
        }
        .padding(.top, 32)
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
        .background(Color.codexBlack)
        .onTapGesture {
            self.showQuestionDetail = true
        }
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(questionTitle: "¿Qué es el Matched Betting", answer: "Es lo más genial del mundo")
    }
}
