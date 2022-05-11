//
//  NormalText.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/02/22.
//

import SwiftUI

struct NormalText: View {
    
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(
                Font.custom(
                    HKGrotesk.regular.rawValue,
                    size: 20
                )
            )
            .foregroundColor(.white)
    }
}

struct NormalText_Previews: PreviewProvider {
    static var previews: some View {
        NormalText(text: "Hola mundo")
    }
}
