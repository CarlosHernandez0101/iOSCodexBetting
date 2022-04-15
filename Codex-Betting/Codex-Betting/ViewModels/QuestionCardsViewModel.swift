//
//  QuestionCardsViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 14/04/22.
//

import Foundation

final class QuestionCardsViewModel: ObservableObject {
    @Published var questions: [QuestionViewModel] = []
}
