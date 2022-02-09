//
//  BackBetView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct BackBetView: View {
    var body: some View {
        
        VStack(spacing: 16) {
            
            HStack {
                Text("Importe de apuesta (Sportbook)")
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
                Text("Cuota a favor")
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
        .background(Color.codexGolden)        
        .cornerRadius(15)
    }
}

struct BackBetView_Previews: PreviewProvider {
    static var previews: some View {
        BackBetView()
            .previewLayout(.sizeThatFits)
    }
}
