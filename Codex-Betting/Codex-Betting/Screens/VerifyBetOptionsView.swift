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
            
            CodexToolBar()
            
            VStack {
                                
                LeadingTitle(title: TextConstants.VerifyBet.title)
                
                //Change this
//                MultiOptionSelectorView()
                
                Spacer()
            }
            .padding(.top, 64)
        }
        .padding(.horizontal, 16)
    }
}

struct VerifyBetOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyBetOptionsView()
    }
}
