//
//  OptionView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct MatchBettingGameOption: View {
    
    @State var isSelected: Bool = false
    @Binding private var currentSelection: MatchSelection
    
    private let optionText: String
    private let index: MatchSelection
    
    init(optionText: String,
         index: MatchSelection,
         currentSelection: Binding<MatchSelection>
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

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        MatchBettingGameOption(optionText: "Apuesta Gratis", index: .match, currentSelection: .constant(.match))
            .previewLayout(.sizeThatFits)
    }
}
