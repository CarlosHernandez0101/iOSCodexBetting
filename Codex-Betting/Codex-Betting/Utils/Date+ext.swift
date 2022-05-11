//
//  Date+ext.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 29/03/22.
//

import Foundation

extension Date {
    var localizedDescription: String {
        return description(with: Locale.current)
    }
}
