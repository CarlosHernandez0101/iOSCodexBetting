//
//  String+ext.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 03/04/22.
//

import Foundation

extension StringProtocol {
    var double: Double? { Double(self) }
    var float: Float? { Float(self) }
    var integer: Int? { Int(self) }
}
