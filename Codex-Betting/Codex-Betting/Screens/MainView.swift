//
//  MainView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 05/02/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            
            Color.codexBlack
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                Image("codex-logo")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                
                InformationCards()
            }
            .padding(.vertical, 32)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
