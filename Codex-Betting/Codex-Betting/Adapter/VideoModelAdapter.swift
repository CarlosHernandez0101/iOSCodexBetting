//
//  VideoModelAdapter.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import Foundation

final class VideoModelAdapter {
    
    func toNetworkModel(from databaseModel: VideoDatabaseModel) -> CourseVideoModel {
        return CourseVideoModel(
            id: databaseModel.id,
            index: databaseModel.index,
            title: databaseModel.title,
            description: databaseModel.descriptionText,
            url: databaseModel.url
        )
    }
}

