//
//  LayBetView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct LayBetView: View {
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
            
            HStack {
                Text("Cuota en contra")
                    .font(
                        Font.custom(
                            HKGrotesk.bold.rawValue,
                            size: 20
                        )
                    )
                .foregroundColor(.white)
                
                Spacer()
                
                Text("Comisión %")
                    .font(
                        Font.custom(
                            HKGrotesk.bold.rawValue,
                            size: 20
                        )
                    )
                .foregroundColor(.white)
            }
            .padding(.bottom, 16)
        }
        .padding(16)
        .background(Color.codexGray)
        .cornerRadius(15)
    }
}

struct LayBetView_Previews: PreviewProvider {
    static var previews: some View {
        LayBetView()
            .previewLayout(.sizeThatFits)
    }
}
