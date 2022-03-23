//
//  VerifyBetView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct VerifyBetView: View {
    var body: some View {
        ZStack {
            Color.codexBlack.edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                
                RequirementWithCheckboxView(
                    requirementText: "Los partidos coinciden"
                )
                
                RequirementWithCheckboxView(
                    requirementText: "Los partidos son a la misma hora"
                )
                
                RequirementWithCheckboxView(
                    requirementText: "Los partidos coinciden"
                )
                
                RequirementWithCheckboxView(
                    requirementText: "Los partidos son a la misma hora"
                )
                RequirementWithCheckboxView(
                    requirementText: "Los partidos coinciden"
                )
                
                RequirementWithCheckboxView(
                    requirementText: "Los partidos son a la misma hora"
                )
            }
            .padding(.horizontal, 16)
        }
    }
}

struct VerifyBetView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyBetView()
    }
}
