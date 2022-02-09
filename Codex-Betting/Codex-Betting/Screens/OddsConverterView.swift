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
            
            VStack {
                
                Text("Cuota americana")
                    .font(
                        Font.custom(
                            HKGrotesk.regular.rawValue,
                            size: 20
                        )
                    )
                    .foregroundColor(.white)
             
                HStack {

                    AmericanOddPicker(americanOdd: $americanOdd)
                    
                    Spacer()
                }
                
                Text("Cuota decimal")
                    .font(
                        Font.custom(
                            HKGrotesk.regular.rawValue,
                            size: 20
                        )
                    )
                    .foregroundColor(.white)
                    .padding(.top, 32)
                
                Text("1.7")
                    .font(
                        Font.custom(
                            HKGrotesk.regular.rawValue,
                            size: 20
                        )
                    )
                    .foregroundColor(.white)
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
