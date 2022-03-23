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
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                    .padding(.leading, 16)
                
                LeadingText(text: "Tipo de apuesta")
                    .padding(.leading, 16)
  
                //Change this
//                MultiOptionSelectorView()
//                    .padding(.top, 32)
//                    .padding(.leading, 16)
                
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
                    .padding(.bottom, 50)
                
            }
            .padding(.horizontal, 16)            
        }
    }
}

struct MatchedBettingCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedBettingCalculatorView()
    }
}
