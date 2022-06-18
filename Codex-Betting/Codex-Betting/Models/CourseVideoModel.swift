//
//  CourseVideoModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation

struct CourseVideoModel: Codable {
    let id: String
    let index: Int
    let title: String?
    let description: String?
    let url: String?
    let duration: String?
}
