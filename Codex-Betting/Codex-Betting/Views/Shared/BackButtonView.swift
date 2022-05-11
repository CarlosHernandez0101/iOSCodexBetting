//
//  BackButtonView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import SwiftUI

struct BackButtonView: View {
    var body: some View {
        Image(systemName: "arrow.backward")
            .foregroundColor(.white)
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
            .previewLayout(.sizeThatFits)
    }
}
