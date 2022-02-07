//
//  ToolsView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        ZStack {
            Color.codexBlack
                .edgesIgnoringSafeArea(.all)
            
            
            ScrollView {
                
                HStack {
                    Text("Herramientas")
                        .foregroundColor(.white)
                        .font(
                            Font.custom(
                                HKGrotesk.bold.rawValue,
                                size: 32
                            )
                    )
                    Spacer()
                }
                
                
                ToolsCards()
            }
            .padding(.top, 32)
            .padding(.horizontal, 16)
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
