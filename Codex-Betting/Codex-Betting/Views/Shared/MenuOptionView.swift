//
//  MenuOptionView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct MenuOptionView: View {
    private let title: String
    private let action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        VStack {
            
            CustomDivider(dividerColor: .codexGray)
            
            HStack {
                LeadingText(text: title)
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
            }
            .padding()
                        
        }
        .onTapGesture {
            action()
        }
        .background(Color.codexBlack)
    }
}

struct MenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionView(title: "Cerrar sesión", action: {})
    }
}
