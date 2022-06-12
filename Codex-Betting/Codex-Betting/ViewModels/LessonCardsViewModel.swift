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
    @Published var hasError: Bool = false        
    
    private var repository: VideoCourseRepositoryProtocol
    private var userRepository: UserRepository = UserRepository(auth: AuthManager(), db: UserDatabase(), network: UserNetwork())
    
    init(repository: VideoCourseRepositoryProtocol) {
        self.repository = repository
        self.repository.delegate = self
        self.userRepository.delegate = self
    }
    
    public func getVideos() {
        RefreshManager.shared.loadDataIfNeeded { needsToRefresh  in
            if needsToRefresh {
                debugPrint("NEEDS")
                self.hasError = false
                self.isLoadingVideos = true
                self.repository.getVideos()
            } else {
                debugPrint("NO NEEDS")
                self.hasError = false
                self.isLoadingVideos = true
                self.repository.getStoredVideos()
            }
        }
    }
}

extension LessonCardsViewModel: VideoCourseRepositoryDelegate {
    
    func didUpdateVideos(_ videos: [CourseVideoModel]) {
        self.hasError = false
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
        debugPrint("Fail get videos")
        self.isLoadingVideos = false
        self.hasError = true
    }
    
    func didExpireAuthToken() {
        if !tokenExists() {
            self.userRepository.getIDToken()
        }
    }
}

extension LessonCardsViewModel: UserRepositoryDelegate {
    func didGetToken(with token: String) {
        globalState.userSession.send(
            UserSession(
                uid: globalState.userSession.value?.uid ?? "",
                email: globalState.userSession.value?.email ?? "",
                token: token,
                isCodexBettingMember: globalState.userSession.value?.isCodexBettingMember ?? false
            )
        )
        self.getVideos()
    }
    
    func didFailGetToken(with error: Error) {
        debugPrint("Failed get token")
    }
}

extension LessonCardsViewModel: GlobalStateInjector {
    func tokenExists() -> Bool {
        globalState.userSession.value?.token != nil
    }
}
