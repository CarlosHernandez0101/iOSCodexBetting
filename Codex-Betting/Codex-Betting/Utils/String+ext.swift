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

extension String {
    var isEmail: Bool { 
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}
