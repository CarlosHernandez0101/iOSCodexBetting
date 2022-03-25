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
            
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                
                LeadingTitle(title: TextConstants.Tools.title)
                
                ToolsCards(viewModel: ToolCardsViewModel())
                    .padding(.top, 32)
            }
            .padding(.top, 1)
            .padding(.bottom, 32)
            .padding(.horizontal, 16)
        }
        .padding(.top)
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
