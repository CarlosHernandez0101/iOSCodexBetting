//
//  VideoCourseRepository.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation

protocol VideoCourseRepositoryDelegate: AnyObject {
    func didUpdateVideos(_ videos: [CourseVideoModel])
    func didFailGetVideos()
    func didExpireAuthToken()
}

protocol VideoCourseRepositoryProtocol {
    var delegate: VideoCourseRepositoryDelegate? { get set }
    var network: CourseVideosNetworkProtocol { get }
    var db: VideoDatabaseProtocol { get }
    func getVideos()
    func getStoredVideos()
}

final class VideoCourseRepository: VideoCourseRepositoryProtocol {
    weak var delegate: VideoCourseRepositoryDelegate?
    var network: CourseVideosNetworkProtocol
    var db: VideoDatabaseProtocol
    var adapter = VideoModelAdapter()
    
    
    init(network: CourseVideosNetworkProtocol, db: VideoDatabaseProtocol) {
        self.network = network
        self.db = db
    }
    
    func getVideos() {
        self.network.getVideos(token: getUserToken() ?? "") { videos in
            
            videos.forEach { video in
                self.db.createVideo(
                    video: VideoDatabaseModel(
                        id: video.id,
                        index: video.index,
                        title: video.title ?? "",
                        description: video.description ?? "",
                        url: video.url ?? "",
                        duration: video.duration ?? ""
                    )
                )
            }
            
            self.delegate?.didUpdateVideos(videos)
        } onError: { error in
            
            if error == "UNAUTHORIZED" {
                self.globalState.userSession.send(
                    UserSession(
                        uid: self.globalState.userSession.value?.uid ?? "",
                        email: self.globalState.userSession.value?.email ?? "",
                        token: nil,
                        isCodexBettingMember: self.globalState.userSession.value?.isCodexBettingMember
                    )
                )
                self.delegate?.didExpireAuthToken()
            }
            
            self.delegate?.didFailGetVideos()
        }
    }
    
    func getStoredVideos() {
        let storedVideos = db.readVideos()
        
        let videos = storedVideos.map({ storedVideo -> CourseVideoModel in
            self.adapter.toNetworkModel(from: storedVideo)
        })
        
        self.delegate?.didUpdateVideos(videos)
    }
}

extension VideoCourseRepository: GlobalStateInjector {
    func getUserToken() -> String? {
        globalState.userSession.value?.token
    }

}
