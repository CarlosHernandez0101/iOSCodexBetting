//
//  OddInput.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 18/02/22.
//

import SwiftUI

struct OddsInput: View {
    
    @Binding private var minimumOdd: String
    @Binding private var maximumOdd: String
    
    init(minimumOdd: Binding<String>, maximumOdd: Binding<String>) {
        self._minimumOdd = minimumOdd
        self._maximumOdd = maximumOdd
    }
    
    var body: some View {
        HStack {
            VStack {
                
                HStack {
                    NormalText(text: TextConstants.MatchedBettingGameForm.OddsInput.minimum)
                    Spacer()
                }                    
                
                CodexTextField(
                    text: $minimumOdd,
                    placeholder: "",
                    keyboardType: .decimalPad,
                    disableAutocorrection: true
                )
                    .padding(.trailing, 16)
            }
            
            VStack {
                
                HStack {
                    Spacer()
                    NormalText(text: TextConstants.MatchedBettingGameForm.OddsInput.maximum)
                }
                
                CodexTextField(
                    text: $maximumOdd,
                    placeholder: "",
                    keyboardType: .decimalPad,
                    disableAutocorrection: true
                )
                    .padding(.leading, 16)
            }
        }
        .background(Color.codexBlack)
    }
}

struct OddInput_Previews: PreviewProvider {
    static var previews: some View {
        OddsInput(minimumOdd: .constant("1.5"), maximumOdd: .constant("4.5"))
    }
}
