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
    
    init(layOddsText: Binding<String>, layCommisionText: Binding<String>) {
        self._layOddsText = layOddsText
        self._layCommisionText = layCommisionText
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
                    
                    CodexTextField(text: $layOddsText, placeholder: "Cuota decimal", keyboardType: .decimalPad, disableAutocorrection: true, colorScheme: .light)
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
                    
                    CodexTextField(text: $layCommisionText, placeholder: "", keyboardType: .decimalPad, disableAutocorrection: true, colorScheme: .light)
                        .padding(.trailing)
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
        LayBetView(layOddsText: .constant("4.5"), layCommisionText: .constant("6.5"))
            .previewLayout(.sizeThatFits)
    }
}
