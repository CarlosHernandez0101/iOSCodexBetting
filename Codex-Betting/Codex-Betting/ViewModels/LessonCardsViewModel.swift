//
//  LessonCardsViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation

final class LessonCardsViewModel: ObservableObject {
    
    @Published var courseVideos: [VideoCourseViewModel] = []

    
    
    init() {
        
    }
}
