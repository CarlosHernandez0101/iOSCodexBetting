//
//  VideoDatabase.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import Foundation
import RealmSwift

protocol VideoDatabaseProtocol {
    func createVideo(video: VideoDatabaseModel)
    func readVideos() -> [VideoDatabaseModel]
    func deleteAllVideos()
}

final class VideoDatabase: VideoDatabaseProtocol {
    
    private var realm: Realm {
        do {
            let realm = try Realm()
            return realm
        }
        catch {
            debugPrint("Could not access database: ", error.localizedDescription)
        }
        return self.realm
    }
    
    func createVideo(video: VideoDatabaseModel) {
        do {
            try realm.write {
                realm.add(video, update: .modified)
            }
        } catch {
            debugPrint("ERROR CREATING VIDEO", error.localizedDescription)
        }
    }
    
    func readVideos() -> [VideoDatabaseModel] {
        Array(realm.objects(VideoDatabaseModel.self))
    }
    
    func deleteAllVideos() {
        do {
            try realm.write {
                
                let videos = realm.objects(VideoDatabaseModel.self)
                
                realm.delete(videos)
            }
        } catch {
            debugPrint("Error deleting all videos", error.localizedDescription)
        }
    }    
    
}
