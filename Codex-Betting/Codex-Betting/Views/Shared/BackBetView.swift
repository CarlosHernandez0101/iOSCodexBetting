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
    
    private let calculate: () -> Void
    
    init(backStakeText: Binding<String>, backOddsText: Binding<String>, backCommision: Binding<String>, calculate: @escaping () -> Void) {
        self._backStakeText = backStakeText
        self._backOddsText = backOddsText
        self._backCommision = backCommision
        
        self.calculate = calculate
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
                
                DecimalPadTextField(
                    text: $backStakeText,
                    keyType: .decimalPad,
                    placeholder: "Importe de apuesta",
                    onSubmit: calculate
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
                    
                    
                    DecimalPadTextField(
                        text: $backOddsText,
                        keyType: .decimalPad,
                        placeholder: "Cuota decimal",
                        onSubmit: calculate
                    )
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
                    
                    
                    DecimalPadTextField(
                        text: $backCommision,
                        keyType: .decimalPad,
                        placeholder: "",
                        onSubmit: calculate
                    )
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
        BackBetView(backStakeText: .constant("100"), backOddsText: .constant("3.5"), backCommision: .constant("4"), calculate: {})
            .previewLayout(.sizeThatFits)
    }
}
