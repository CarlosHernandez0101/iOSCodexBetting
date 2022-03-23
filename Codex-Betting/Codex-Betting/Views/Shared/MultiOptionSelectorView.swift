//
//  MultiOptionSelectorView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct MultiOptionSelectorView: View {
    
    @Binding var currentSelection: MatchSelection
    
    init(currentSelection: Binding<MatchSelection>) {
        self._currentSelection = currentSelection
    }
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    MatchBettingGameOption(
                        optionText: "Cualquier evento",
                        index: .anyEvent,
                        currentSelection: $currentSelection
                    )
                    MatchBettingGameOption(
                        optionText: "Partido",
                        index: .match,
                        currentSelection: $currentSelection
                    )
                    MatchBettingGameOption(
                        optionText: "Liga/Competición",
                        index: .league,
                        currentSelection: $currentSelection
                    )
                    MatchBettingGameOption(
                        optionText: "Bienvenida Betfair",
                        index: .welcome,
                        currentSelection: $currentSelection
                    )
                    
                }
                Spacer()
            }
        }
        .background(Color.codexBlack)
        
    }
}

struct MultiOptionSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MultiOptionSelectorView(currentSelection: .constant(.match))
    }
}
