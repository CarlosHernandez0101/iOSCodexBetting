//
//  LayStakeRequiredView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 08/02/22.
//

import SwiftUI

struct LayStakeRequiredView: View {
    
    private let moneyToBet: Double
    
    init(moneyToBet: Double) {
        self.moneyToBet = moneyToBet
    }
    
    var body: some View {
        HStack {
            Text("Dinero por apostar:")
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
            
            Text(String("$\(moneyToBet)"))
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 20
                    )
                )
            .foregroundColor(.white)
            .padding(.vertical, 16)
            
            CopyToClipboardButton()
                .padding(.horizontal, 16)
            
        }
        .background(Color.codexGray)
        .cornerRadius(15)        
    }
}

struct LayStakeRequiredView_Previews: PreviewProvider {
    static var previews: some View {
        LayStakeRequiredView(moneyToBet: 400.5)
    }
}
