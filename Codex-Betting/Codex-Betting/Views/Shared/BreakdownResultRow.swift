//
//  BreakdownResultRow.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct BreakdownResultRow: View {
    var body: some View {
        HStack {
            Text("1350")
                .font(
                    Font.custom(
                        HKGrotesk.regular.rawValue,
                        size: 20
                    )
                )
                .foregroundColor(.white)
            
            Spacer()
            
            Text("0")
                .font(
                    Font.custom(
                        HKGrotesk.regular.rawValue,
                        size: 20
                    )
                )
                .foregroundColor(.white)
            
            Spacer()
            
            Text("-10")
                .font(
                    Font.custom(
                        HKGrotesk.regular.rawValue,
                        size: 20
                    )
                )
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .background(Color.codexBlack)
    }
}

struct BreakdownResultRow_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownResultRow()
    }
}
