//
//  CalculatorSelectorView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 02/04/22.
//

import SwiftUI

struct CalculatorSelectorView: View {
    @Binding private var currentSelection: CalculatorSelection
    
    init(currentSelection: Binding<CalculatorSelection>) {
        self._currentSelection = currentSelection
    }
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    CalculatorOptionView(optionText: "Dinero real", index: .normal, currentSelection: $currentSelection)
                    
                    CalculatorOptionView(optionText: "Apuesta gratis", index: .freebet, currentSelection: $currentSelection)
                    
                }
                Spacer()
            }
        }
        .background(Color.codexBlack)
        .padding()
    }
}

struct CalculatorSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorSelectorView(currentSelection: .constant(.freebet))
    }
}
