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
    
    private var squareSize: CGFloat = 40
    private var checkmarkSize: CGFloat = 30
    
    init(isSelected: Binding<Bool>, squareSize: CGFloat = 40, checkmarkSize: CGFloat = 30) {
        self._isSelected = isSelected
        self.squareSize = squareSize
        self.checkmarkSize = checkmarkSize
    }
    
    var body: some View {
        ZStack {
            
            Image(systemName: "square")
                .foregroundColor(.white)
                .font(.system(size: squareSize))
                
            
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.codexGreen)
                    .font(.system(size: checkmarkSize))
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
