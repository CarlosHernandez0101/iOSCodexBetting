//
//  CalculatorOptionView.swift
//  Codex-Betting
//
//  Created by Casai User on 02/04/22.
//

import SwiftUI

struct CalculatorOptionView: View {
    
    @State var isSelected: Bool = false
    @Binding private var currentSelection: CalculatorSelection
    
    private let optionText: String
    private let index: CalculatorSelection
    
    init(optionText: String,
         index: CalculatorSelection,
         currentSelection: Binding<CalculatorSelection>
    ) {
        self.optionText = optionText
        self.index = index
        self._currentSelection = currentSelection
    }
    
    private func updateSelection() {
        isSelected = currentSelection == index
    }
    
    var body: some View {
        HStack {
            
            OptionCircle(isSelected: $isSelected)
            
            NormalText(text: optionText)
                .foregroundColor(isSelected ? .codexGolden : .white)
        }
        .onTapGesture {
            currentSelection = index
        }
        .onChange(of: currentSelection, perform: { newValue in
            updateSelection()
        })
        .onAppear(perform: {
            updateSelection()
        })
        .padding(.vertical, 8)
        .background(Color.codexBlack)
    }
}

struct CalculatorOptionView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorOptionView(optionText: "Free bet", index: .freebet, currentSelection: .constant(.freebet))
    }
}
