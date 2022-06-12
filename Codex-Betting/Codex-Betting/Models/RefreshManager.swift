//
//  RefreshManager.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import Foundation

class RefreshManager: NSObject {

    static let shared = RefreshManager()
    private let defaults = UserDefaults.standard
    private let defaultsKey = "lastVideosRefresh"
    private let calender = Calendar.current

    func loadDataIfNeeded(completion: (Bool) -> Void) {

        if isRefreshRequired() {            
            completion(true)
        } else {
            completion(false)
        }
    }

    private func isRefreshRequired() -> Bool {

        guard let lastRefreshDate = defaults.object(forKey: defaultsKey) as? Date else {
            return true
        }

        if let diff = calender.dateComponents([.hour], from: lastRefreshDate, to: Date()).hour, diff > 24 {
            debugPrint("Current diferrence", diff)
            return true
        } else {
            return false
        }
    }
}
