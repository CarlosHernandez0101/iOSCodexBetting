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
}

protocol VideoCourseRepositoryProtocol {
    var delegate: VideoCourseRepositoryDelegate? { get set }
    var network: CourseVideosNetworkProtocol { get }
    func getVideos()
}

final class VideoCourseRepository: VideoCourseRepositoryProtocol {
    weak var delegate: VideoCourseRepositoryDelegate?
    var network: CourseVideosNetworkProtocol
    
    
    init(network: CourseVideosNetworkProtocol) {
        self.network = network
    }
    
    func getVideos() {
        self.network.getVideos(token: getUserToken() ?? "") { videos in
            self.delegate?.didUpdateVideos(videos)
        } onError: { error in
            self.delegate?.didFailGetVideos()
        }
    }
}

extension VideoCourseRepository: GlobalStateInjector {
    func getUserToken() -> String? {
        globalState.userSession.value?.token
    }

}
