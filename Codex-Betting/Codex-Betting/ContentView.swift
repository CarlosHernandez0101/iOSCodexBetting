//
//  ContentView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 04/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MatchedBettingGameForm()
            .preferredColorScheme(.dark)
                        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
