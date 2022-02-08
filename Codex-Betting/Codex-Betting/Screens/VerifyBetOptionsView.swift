//
//  VerifyBetOptionsView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct VerifyBetOptionsView: View {
    var body: some View {
        ZStack {
            
            Color.codexBlack.edgesIgnoringSafeArea(.all)
            
            VStack {
                                
                LeadingTitle(title: "Verificar")
                
                MultiOptionSelectorView()
                
                Spacer()
            }
            
            
        }
    }
}

struct VerifyBetOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyBetOptionsView()
    }
}
