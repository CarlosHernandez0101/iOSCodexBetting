//
//  VerifyBetSelectorView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 25/03/22.
//

import SwiftUI

struct VerifyBetSelectorView: View {
    
    @Binding var currentSelection: VerifySelection
    
    init(currentSelection: Binding<VerifySelection>) {
        self._currentSelection = currentSelection
    }
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    VerifyBetOptionView(
                        optionText: "Apuesta favor - contra",
                        index: .bet,
                        currentSelection: $currentSelection
                    )
                    
                    VerifyBetOptionView(
                        optionText: "Depósito",
                        index: .deposit,
                        currentSelection: $currentSelection
                    )
                    
                }
                Spacer()
            }
        }
        .background(Color.codexBlack)
        .padding()        
    }
}

struct VerifyBetSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyBetSelectorView(currentSelection: .constant(.bet))
    }
}
