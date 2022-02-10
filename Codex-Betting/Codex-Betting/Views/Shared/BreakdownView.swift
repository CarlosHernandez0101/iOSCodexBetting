//
//  BreakdownView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct BreakdownView: View {
    var body: some View {
        VStack(spacing: 16) {
            
            
            HStack {

                Text("Bookie")
                    .font(
                        Font.custom(
                            HKGrotesk.bold.rawValue,
                            size: 20
                        )
                    )
                .foregroundColor(.white)
                
                Spacer()
                
                Text("Exchange")
                    .font(
                        Font.custom(
                            HKGrotesk.bold.rawValue,
                            size: 20
                        )
                    )
                .foregroundColor(.white)
                
                Spacer()
                
                Text("Total")
                    .font(
                        Font.custom(
                            HKGrotesk.bold.rawValue,
                            size: 20
                        )
                    )
                .foregroundColor(.white)
                
            }
            .padding(.horizontal, 8)
            .frame(width: UIScreen.main.bounds.width)
            
            
            BreakdownRow(text: "Si el sportbook gana", color: .codexGolden)
                .cornerRadius(15)
                
            BreakdownResultRow()
            
            BreakdownRow(
                text: "Si el Exchange gana",
                color: .codexGray
            )
                .cornerRadius(15)
            
            BreakdownResultRow()
            
        }
        .background(Color.codexBlack)
    }
}

struct BreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownView()
    }
}
