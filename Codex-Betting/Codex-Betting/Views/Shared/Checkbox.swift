//
//  Checkbox.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct Checkbox: View {
    
    @Binding private var isSelected: Bool
    private let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    init(isSelected: Binding<Bool>) {
        self._isSelected = isSelected
    }
    
    var body: some View {
        ZStack {
            
            Image(systemName: "square")
                .foregroundColor(.white)
                .font(.system(size: 40))
                
            
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.codexGreen)
                    .font(.system(size: 30))
            }
            
        }
        .background(Color.codexBlack)
        .onTapGesture {
            isSelected.toggle()
            impactFeedbackGenerator.impactOccurred()
        }
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(isSelected: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
