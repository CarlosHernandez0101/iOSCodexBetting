//
//  QuestionViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/04/22.
//

import Foundation

final class QuestionViewModel: ObservableObject {
    public let id = UUID()
    @Published var question: String
    @Published var answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}
