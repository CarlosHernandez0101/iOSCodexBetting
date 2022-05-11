//
//  VideoView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import Foundation
import SwiftUI
import UIKit
import WebKit

struct VideoView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = url else {
            return
        }
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: url))
 
    }
}
