//
//  RequirementWithCheckboxView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct RequirementWithCheckboxView: View {
    
    private let requirementText: String
    
    init(requirementText: String) {
        self.requirementText = requirementText
    }
    
    var body: some View {
        HStack {
            Text(requirementText)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 25
                    )
                )
                .foregroundColor(.white)
            
            Spacer()
            
            Checkbox(isSelected: .constant(true))
                
        }
        .padding(.vertical, 32)
        .fixedSize(horizontal: false, vertical: true)
        .background(Color.codexBlack)
    }
}

struct RequirementWithCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementWithCheckboxView(
            requirementText: "Los partidos coinciden"
        )
            .previewLayout(.sizeThatFits)
    }
}
