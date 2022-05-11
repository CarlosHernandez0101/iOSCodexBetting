//
//  VerifyBetOptionView.swift
//  Codex-Betting
//
//  Created by  on 25/03/22.
//

import SwiftUI

struct VerifyBetOptionView: View {
    
    @State var isSelected: Bool = false
    @Binding private var currentSelection: VerifySelection
    
    private let optionText: String
    private let index: VerifySelection
    
    init(optionText: String,
         index: VerifySelection,
         currentSelection: Binding<VerifySelection>
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

struct VerifyBetOption_Previews: PreviewProvider {
    static var previews: some View {
        VerifyBetOptionView(
            optionText: "Apuesta", index: .bet, currentSelection: .constant(.bet))
    }
}
