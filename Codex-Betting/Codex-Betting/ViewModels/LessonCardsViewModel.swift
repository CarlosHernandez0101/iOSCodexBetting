//
//  LessonCardsViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation

final class LessonCardsViewModel: ObservableObject {
    
    @Published var courseVideos: [VideoCourseViewModel] = []
    @Published var isLoadingVideos: Bool = false
    
    private var repository: VideoCourseRepositoryProtocol
    
    init(repository: VideoCourseRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    public func getVideos() {
        self.isLoadingVideos = true
        self.repository.getVideos()
    }
}

extension LessonCardsViewModel: VideoCourseRepositoryDelegate {
    
    func didUpdateVideos(_ videos: [CourseVideoModel]) {
        self.isLoadingVideos = false
        self.courseVideos = videos.map({ courseVideo -> VideoCourseViewModel in
            VideoCourseViewModel(
                id: courseVideo.id,
                index: courseVideo.index,
                title: courseVideo.title ?? "",
                description: courseVideo.description ?? "",
                url: courseVideo.url ?? ""
            )
        }).sorted(by: { $0.index < $1.index })
        courseVideos.forEach { video in
            debugPrint("INDEX", video.index)
        }
    }
    
    func didFailGetVideos() {
        self.isLoadingVideos = false
    }
}
