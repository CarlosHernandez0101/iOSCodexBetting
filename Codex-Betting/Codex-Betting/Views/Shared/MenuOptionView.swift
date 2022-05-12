//
//  MenuOptionView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct MenuOptionView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
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
        .background(Color.codexBlack)
    }
}

struct MenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionView(title: "Cerrar sesión")
    }
}
