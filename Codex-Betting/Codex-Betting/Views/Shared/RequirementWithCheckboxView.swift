//
//  RequirementWithCheckboxView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct RequirementWithCheckboxView: View {
    
    @Binding private var viewModel: RequirementViewModel
    
    init(viewModel: Binding<RequirementViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Text(viewModel.requerimentText)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 20
                    )
                )
                .foregroundColor(.white)
            
            Spacer()
            
            Checkbox(isSelected: $viewModel.isDone)
                
        }
        .padding(.vertical, 32)
        .fixedSize(horizontal: false, vertical: true)
        .background(Color.codexBlack)
    }
}

struct RequirementWithCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementWithCheckboxView(
            viewModel: .constant(RequirementViewModel(requerimentText: ""))
        )
            .previewLayout(.sizeThatFits)
    }
}
