//
//  OddsConverterView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 08/02/22.
//

import SwiftUI

struct OddsConverterView: View {
    
    @State private var americanOdd: Int = 0
    
    var body: some View {
        ZStack {
            Color.codexBlack.edgesIgnoringSafeArea(.all)
            
            CodexToolBar()
                .padding(.leading, 16)
            
            VStack {
                
                NormalText(text: TextConstants.OddsConverter.americanOdd)
             
                HStack {

                    AmericanOddPicker(americanOdd: $americanOdd)
                    
                    Spacer()
                }
                
                NormalText(text: TextConstants.OddsConverter.decimalOdd)
                    .padding(.top, 32)
                
                NormalText(text: "1.7")
                    .padding(.top, 16)
                
            }
            .padding(.horizontal, 16)
            
        }
    }
}

struct OddsConverterView_Previews: PreviewProvider {
    static var previews: some View {
        OddsConverterView()
    }
}
