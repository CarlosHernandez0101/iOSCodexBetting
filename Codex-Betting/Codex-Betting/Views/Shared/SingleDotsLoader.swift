//
//  SingleDotsLoader.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/05/22.
//

import SwiftUI

public struct SingleLoaderDot: View {
    @State var delay: Double = 0
    @State var scale: CGFloat = 0.5
    
    public var body: some View {
        Circle()
            .fill(Color.codexGolden)
            .frame(width: 5, height: 5)
            .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 0.6).repeatForever().delay(delay))
            .onAppear {
                withAnimation {
                    self.scale = 1
                }
            }
    }
}

struct SingleDotsLoader_Previews: PreviewProvider {
    static var previews: some View {
        SingleLoaderDot()
    }
}
