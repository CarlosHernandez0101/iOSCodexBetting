//
//  OptionCircle.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct OptionCircle: View {
    
    @Binding private var isSelected: Bool
    
    init(isSelected: Binding<Bool>) {
        self._isSelected = isSelected
    }
    
    var body: some View {
        Circle()
            .frame(width: 20, height: 20)
            .foregroundColor(isSelected ? .codexGolden  : .white)
            
    }
}

struct OptionCircle_Previews: PreviewProvider {
    static var previews: some View {
        OptionCircle(isSelected: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
