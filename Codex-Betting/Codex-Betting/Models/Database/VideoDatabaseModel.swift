//
//  VideoDatabaseModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import Foundation
import RealmSwift


class VideoDatabaseModel: Object {
    override static func primaryKey() -> String {
        return "id"
    }
    
    @objc dynamic var id: String = ""
    @objc dynamic var index: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var duration: String = ""
    
    convenience init(id: String,
                     index: Int,
                     title: String,
                     description: String,
                     url: String,
                     duration: String
    ) {
        self.init()
        self.id = id
        self.index = index
        self.title = title
        self.descriptionText = description
        self.url = url
        self.duration = duration
    }

}
