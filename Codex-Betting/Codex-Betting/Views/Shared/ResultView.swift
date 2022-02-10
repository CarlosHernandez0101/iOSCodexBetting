//
//  ResultView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        HStack {
            Text("Ganarás")
                .foregroundColor(.white)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 28
                    )
            )
            
            Text("$1000.00")
                .foregroundColor(.codexGreen)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 28
                    )
            )
            
        }
        .background(Color.codexBlack)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
