//
//  UIApplication+ext.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 18/02/22.
//

import UIKit

extension UIApplication {
    
    /// Notifies this object that it has been asked to relinquish its status as first responder in its window.
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension UIApplication: UIApplicationProtocol { }

protocol UIApplicationProtocol {
    func open(_ url: URL,
              options: [UIApplication.OpenExternalURLOptionsKey: Any],
              completionHandler completion: ((Bool) -> Void)?)
}
