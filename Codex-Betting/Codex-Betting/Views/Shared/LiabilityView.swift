//
//  LiabilityView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import SwiftUI

struct LiabilityView: View {
    
    private let liability: Double
    
    init(liability: Double) {
        self.liability = liability
    }
    
    var body: some View {
        HStack {
            Text("Riesgo requerido:")
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 20
                    )
                )
            .foregroundColor(.white)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.vertical, 16)
            .padding(.leading, 16)
            
            Spacer()
            
            Text(String("$\(liability)"))
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 20
                    )
                )
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .padding(.trailing, 16)
            
        }
        .background(Color.codexGray)
        .cornerRadius(15)
    }
}

struct LiabilityView_Previews: PreviewProvider {
    static var previews: some View {
        LiabilityView(liability: 50)
    }
}
