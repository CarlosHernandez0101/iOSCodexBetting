//
//  OptionView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct OptionView: View {
    
    @State var isSelected: Bool
    
    private let optionText: String
    
    init(isSelected: Bool, optionText: String) {
        self._isSelected = State(wrappedValue: isSelected)
        self.optionText = optionText
    }
    
    var body: some View {
        HStack {
            
            OptionCircle(isSelected: $isSelected)
            
            Text(optionText)
                .font(
                    Font.custom(HKGrotesk.regular.rawValue,
                                size: 25
                               )
                )
                .foregroundColor(isSelected ? .codexGolden : .white)
        }
        .padding(.vertical, 16)
        .background(Color.codexBlack)
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView(isSelected: true, optionText: "Apuesta Gratis")
            .previewLayout(.sizeThatFits)
    }
}
