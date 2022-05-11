//
//  CustomerServiceManager.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 22/02/22.
//

import Foundation

protocol CustomerServiceProtocol {
    var customerServiceChannelURL: String { get set}
}

final class CustomerServiceManager: CustomerServiceProtocol {
    
    var customerServiceChannelURL: String = ""
    
    
}
