//
//  DotsLoader.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import SwiftUI

struct DotsLoader: View {
    var body: some View {
        VStack {
            NormalText(text: "Cargando")
            
            HStack {
                SingleLoaderDot()
                
                SingleLoaderDot(delay: 0.2)
                
                SingleLoaderDot(delay: 0.4)
            }
        }
        .padding()
        .background(Color.codexBlack)
    }
}

struct DotsLoader_Previews: PreviewProvider {
    static var previews: some View {
        DotsLoader()
    }
}
