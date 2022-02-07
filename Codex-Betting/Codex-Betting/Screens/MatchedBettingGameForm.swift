//
//  MatchedBettingGameForm.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct MatchedBettingGameForm: View {
    
    @State var showingSheet: Bool = true
    
    var body: some View {
        ZStack {
            Color.codexBlack
                .edgesIgnoringSafeArea(.all)
            
        }
        .sheet(isPresented: $showingSheet) {
            RecommendationView(isPresented: $showingSheet)
        }
    }
}

struct MatchedBettingGameForm_Previews: PreviewProvider {
    static var previews: some View {
        MatchedBettingGameForm()
    }
}
