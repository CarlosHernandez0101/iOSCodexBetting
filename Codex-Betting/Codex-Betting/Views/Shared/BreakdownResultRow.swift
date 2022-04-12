//
//  BreakdownResultRow.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct BreakdownResultRow: View {
    private let leftResult: String
    private let rightResult: String
    private let total: String
    
    init(leftResult: String, rightResult: String, total: String) {
        self.leftResult = leftResult
        self.rightResult = rightResult
        self.total = total
    }
    
    var body: some View {
        HStack {
            Text("$\(leftResult)")
                .font(
                    Font.custom(
                        HKGrotesk.regular.rawValue,
                        size: 20
                    )
                )
                .foregroundColor(.white)
            
            Spacer()
            
            Text("$\(rightResult)")
                .font(
                    Font.custom(
                        HKGrotesk.regular.rawValue,
                        size: 20
                    )
                )
                .foregroundColor(.white)
            
            Spacer()
            
            Text("$\(total)")
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
        BreakdownResultRow(leftResult: "100", rightResult: "100", total: "100")
    }
}
