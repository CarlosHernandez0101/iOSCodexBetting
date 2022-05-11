//
//  ResultView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct ResultView: View {
    private let isPositive: Bool
    private let total: String
    
    init(isPositive: Bool, total: String) {
        self.isPositive = isPositive
        self.total = total
    }
    
    private var fontColor: Color {
        isPositive ? .codexGreen : .red
    }
    
    var body: some View {
        HStack {
            Text(isPositive ? "Ganarás" : "Perderás")
                .foregroundColor(.white)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 28
                    )
            )
            
            Text("$\(total)")
                .foregroundColor(fontColor)
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
        ResultView(isPositive: true, total: "1000")
    }
}
