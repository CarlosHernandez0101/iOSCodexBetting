//
//  MatchedBettingCalculatorView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct MatchedBettingCalculatorView: View {
    var body: some View {
        ZStack {
            
            Color.codexBlack.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                LeadingText(text: "Tipo de apuesta")
                
                MultiOptionSelectorView()
                    .padding(.top, 32)
                
                BackBetView()
                    .padding(.top, 32)
                
                LayBetView()
                    .padding(.top, 16)
                
                LayStakeRequiredView(moneyToBet: 50.5)
                    .padding(.top, 16)
                
                LiabilityView(liability: 500)
                    .padding(.top, 8)
                
                BreakdownView()
                    .padding(.top, 32)
                
                ResultView()
                    .padding(.top, 32)
                
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 50)
            
        }
    }
}

struct MatchedBettingCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedBettingCalculatorView()
    }
}
