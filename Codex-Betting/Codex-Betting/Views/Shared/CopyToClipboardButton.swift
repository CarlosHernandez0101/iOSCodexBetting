//
//  CopyToClipboardButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct CopyToClipboardButton: View {
    private let copyAction: () -> Void
    
    init(copyAction: @escaping () -> Void) {
        self.copyAction = copyAction
    }
    
    var body: some View {
        Button(action: {
            copyAction()
        }) {
            Image(systemName: "doc.on.doc")
                .foregroundColor(.white)
        }
    }
}

struct CopyToClipboardButton_Previews: PreviewProvider {
    static var previews: some View {
        CopyToClipboardButton(copyAction: {})
            .previewLayout(.sizeThatFits)
    }
}
