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
    func getVideos()
}

final class VideoCourseRepository: VideoCourseRepositoryProtocol {
    weak var delegate: VideoCourseRepositoryDelegate?
    
    let decoder: JSONDecoder = JSONDecoder()
    
    func getVideos() {
        do {
            
            guard let data = loadJSON() else {
                self.delegate?.didFailGetVideos()
                return
            }
            
            let videoCourses = try decoder.decode([CourseVideoModel].self, from: data)
            
            self.delegate?.didUpdateVideos(videoCourses)
            
        } catch {
            debugPrint("ERROR PARSING JSON", error.localizedDescription)
            self.delegate?.didFailGetVideos()
        }
    }
    
    private func loadJSON() -> Data? {
        do {
            
            if let bundlePath = Bundle.main.path(forResource: "CourseVideos", ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
            
        } catch {
            debugPrint("EROR LOADING JSON", error.localizedDescription)
        }
        
        return nil
    }
}
