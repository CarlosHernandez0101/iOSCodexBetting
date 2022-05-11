//
//  LayBetView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct LayBetView: View {
    @Binding private var layOddsText: String
    @Binding private var layCommisionText: String
    
    private let calculate: () -> Void
    
    init(layOddsText: Binding<String>, layCommisionText: Binding<String>, calculate: @escaping () -> Void) {
        self._layOddsText = layOddsText
        self._layCommisionText = layCommisionText
        
        self.calculate = calculate
    }
    
    var body: some View {
        VStack(spacing: 16) {
            
            HStack {
                Text("Apuesta en contra (Exchange)")
                    .font(
                        Font.custom(
                            HKGrotesk.bold.rawValue,
                            size: 20
                        )
                    )
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Cuota en contra")
                        .font(
                            Font.custom(
                                HKGrotesk.bold.rawValue,
                                size: 20
                            )
                        )
                        .foregroundColor(.white)
                    
                    DecimalPadTextField(
                        text: $layOddsText,
                        keyType: .decimalPad,
                        placeholder: "Cuota en contra",
                        onSubmit:
                            calculate
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
                        .padding(.trailing)
                                        
                    DecimalPadTextField(
                        text: $layCommisionText,
                        keyType: .decimalPad,
                        placeholder: "",
                        onSubmit: calculate)
                    
                }
            }
            .padding(.bottom, 16)
            .padding(.leading)
        }
        .background(Color.codexGray)
        .cornerRadius(15)
    }
}

struct LayBetView_Previews: PreviewProvider {
    static var previews: some View {
        LayBetView(layOddsText: .constant("4.5"), layCommisionText: .constant("6.5"),
                   calculate: {}
        )
            .previewLayout(.sizeThatFits)
    }
}
