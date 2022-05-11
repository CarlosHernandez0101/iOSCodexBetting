//
//  RequirementsView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 25/03/22.
//

import SwiftUI

struct RequirementsView: View {
    @Binding private var requeriments: [RequirementViewModel]
    
    init(requeriments: Binding<[RequirementViewModel]>) {
        self._requeriments = requeriments
    }
    
    var body: some View {
        ForEach(0..<requeriments.count, id: \.self) { index in
            RequirementWithCheckboxView(viewModel: $requeriments[index])
        }
    }
}

struct RequirementsView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementsView(requeriments: .constant([]))
    }
}
