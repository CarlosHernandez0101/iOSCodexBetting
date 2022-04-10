//
//  BreakdownView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct BreakdownView: View {
    
    private let leftSideSportBook: String
    private let rightSideSportBook: String
    private let totalSportBook: String
    private let leftSideExchange: String
    private let rightSideExchange: String
    private let totalExchange: String
    
    init(leftSideSportBook: String,
         rightSideSportBook: String,
         totalSportBook: String,
         leftSideExchange: String,
         rightSideExchange: String,
         totalExchange: String) {
        self.leftSideSportBook = leftSideSportBook
        self.rightSideSportBook = rightSideSportBook
        self.totalSportBook = totalSportBook
        self.leftSideExchange = leftSideExchange
        self.rightSideExchange = rightSideExchange
        self.totalExchange = totalExchange
    }
    
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
                
            BreakdownResultRow(leftResult: leftSideSportBook, rightResult: rightSideSportBook, total: totalSportBook)
            
            BreakdownRow(
                text: "Si el Exchange gana",
                color: .codexGray
            )
                .cornerRadius(15)
            
            BreakdownResultRow(leftResult: leftSideExchange, rightResult: rightSideExchange, total: totalExchange)
            
        }
        .background(Color.codexBlack)
    }
}

struct BreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownView(
            leftSideSportBook: "25",
            rightSideSportBook: "50",
            totalSportBook: "100",
            leftSideExchange: "125",
            rightSideExchange: "150",
            totalExchange: "200"
        )
    }
}
