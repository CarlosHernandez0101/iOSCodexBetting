//
//  Double+ext.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 10/04/22.
//

import Foundation

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
