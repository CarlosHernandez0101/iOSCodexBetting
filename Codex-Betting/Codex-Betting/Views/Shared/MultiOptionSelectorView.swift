//
//  MultiOptionSelectorView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct MultiOptionSelectorView: View {
    var body: some View {
        
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    //TODO: MAKE A SUBVIEW FOR THIS
                    OptionView(
                        isSelected: false,
                        optionText: "Apuesta requisito"
                    )
                    OptionView(
                        isSelected: true,
                        optionText: "Apuesta gratis"
                    )
                    OptionView(
                        isSelected: false,
                        optionText: "Código"
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
        MultiOptionSelectorView()
    }
}
