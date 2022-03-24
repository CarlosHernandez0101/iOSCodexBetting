//
//  VideoCourseViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation

class VideoCourseViewModel: ObservableObject {
    public let id = UUID()
    @Published var title: String
    @Published var description: String
    @Published var url: String
    
    init(title: String, description: String, url: String) {
        self.title = title
        self.description = description
        self.url = url
    }
}
