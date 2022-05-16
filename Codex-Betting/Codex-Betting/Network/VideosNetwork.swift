//
//  VideosNetwork.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import Foundation

typealias onVideosSuccess = ([CourseVideoModel]) -> Void
typealias onVideosError = (String) -> Void


protocol CourseVideosNetworkProtocol {
    func getVideos(token: String, onSuccess: @escaping onVideosSuccess, onError: @escaping onVideosError)
}

final class CourseVideosNetwork: CourseVideosNetworkProtocol {
    
    private let decoder = JSONDecoder()
    
    func getVideos(token: String, onSuccess: @escaping onVideosSuccess, onError: @escaping onVideosError) {
        
        let sessionConfig = URLSessionConfiguration.default
        let authValue: String? = "Bearer \(token)"
        sessionConfig.httpAdditionalHeaders = ["Authorization": authValue ?? ""]
        let session = URLSession(configuration: sessionConfig, delegate: self as? URLSessionDelegate, delegateQueue: nil)
        
        guard let url = URL(string:
                                "\(URLContants.VIDEOS_URL)") else {
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                    
                if let error = error {
                    debugPrint("ERROR GET USER", error.localizedDescription)
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    debugPrint("Invalid data or response")
                    onError("Invalid data or response")
                    return
                }
                
                do {
                    
                    if response.statusCode == 403 {
                        onError("UNAUTHORIZED")
                        return
                    }
                    
                    if response.statusCode == 200 {
                        let videos = try self.decoder.decode([CourseVideoModel].self, from: data)
                        
                        onSuccess(videos)
                        return
                    }
                    
                } catch {
                    onError(error.localizedDescription)
                    return
                }
            }
        }
        
        task.resume()
    }
        
}
