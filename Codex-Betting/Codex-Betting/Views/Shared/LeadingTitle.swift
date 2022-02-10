//
//  LeadingTitle.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LeadingTitle: View {
    
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 32
                    )
            )
            Spacer()
        }
    }
}

struct LeadingTitle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.codexBlack
            LeadingTitle(title: "Herramientas")
        }
    }
}
