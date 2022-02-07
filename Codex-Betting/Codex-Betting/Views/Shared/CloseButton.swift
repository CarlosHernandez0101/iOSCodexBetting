//
//  CloseButton.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct CloseButton: View {
    
    @Binding private var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    var body: some View {
        Button(action: {
            isPresented = false
        }) {
            ZStack {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.codexGray)
                
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
