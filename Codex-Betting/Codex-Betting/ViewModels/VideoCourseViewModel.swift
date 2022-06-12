//
//  VideoCourseViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation

class VideoCourseViewModel: ObservableObject {
    @Published var id: String
    @Published var index: Int
    @Published var title: String
    @Published var description: String
    @Published var url: String
    
    init(id: String, index: Int, title: String, description: String, url: String) {
        self.id = id
        self.index = index
        self.title = title
        self.description = description
        self.url = url
    }
}
