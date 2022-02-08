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
