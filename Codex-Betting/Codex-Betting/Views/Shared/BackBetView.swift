//
//  BackBetView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct BackBetView: View {
    @Binding private var backStakeText: String
    @Binding private var backOddsText: String
    @Binding private var backCommision: String
    
    init(backStakeText: Binding<String>, backOddsText: Binding<String>, backCommision: Binding<String>) {
        self._backStakeText = backStakeText
        self._backOddsText = backOddsText
        self._backCommision = backCommision
    }
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            VStack {
                HStack {
                    Text("Importe de apuesta (Bookie)")
                        .font(
                            Font.custom(
                                HKGrotesk.bold.rawValue,
                                size: 20
                            )
                        )
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                
                CodexTextField(
                    text: $backStakeText,
                    placeholder: "Cuota a favor",
                    keyboardType: .decimalPad,
                    disableAutocorrection: false,
                    colorScheme: .light
                )
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Cuota a favor")
                        .font(
                            Font.custom(
                                HKGrotesk.bold.rawValue,
                                size: 20
                            )
                        )
                    .foregroundColor(.white)
                    
                    CodexTextField(text: $backOddsText, placeholder: "Cuota decimal", keyboardType: .decimalPad, disableAutocorrection: true, colorScheme: .light)
                        .padding(.trailing)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Comisión %")
                        .font(
                            Font.custom(
                                HKGrotesk.bold.rawValue,
                                size: 20
                            )
                        )
                    .foregroundColor(.white)
                    
                    CodexTextField(text: $backCommision, placeholder: "", keyboardType: .decimalPad, disableAutocorrection: true, colorScheme: .light)
                        .padding(.leading)
                }
                
            }
            .padding(.bottom, 16)
        }
        .padding(16)
        .background(Color.codexGolden)        
        .cornerRadius(15)
    }
}

struct BackBetView_Previews: PreviewProvider {
    static var previews: some View {
        BackBetView(backStakeText: .constant("100"), backOddsText: .constant("3.5"), backCommision: .constant("4"))
            .previewLayout(.sizeThatFits)
    }
}
