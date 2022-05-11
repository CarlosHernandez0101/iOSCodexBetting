//
//  LessonCardsViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation

final class LessonCardsViewModel: ObservableObject {
    
    @Published var courseVideos: [VideoCourseViewModel] = []
    
    private var repository: VideoCourseRepositoryProtocol
    
    init(repository: VideoCourseRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    public func getVideos() {
        self.repository.getVideos()
    }
}

extension LessonCardsViewModel: VideoCourseRepositoryDelegate {
    
    func didUpdateVideos(_ videos: [CourseVideoModel]) {
        self.courseVideos = videos.map({ courseVideo -> VideoCourseViewModel in
            VideoCourseViewModel(
                title: courseVideo.title ?? "",
                description: courseVideo.description ?? "",
                url: courseVideo.url ?? ""
            )
        })
    }
    
    func didFailGetVideos() {
        
    }
}
