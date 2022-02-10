//
//  CopyToClipboardButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct CopyToClipboardButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "doc.on.doc")
                .foregroundColor(.white)
        }
    }
}

struct CopyToClipboardButton_Previews: PreviewProvider {
    static var previews: some View {
        CopyToClipboardButton()
            .previewLayout(.sizeThatFits)
    }
}
