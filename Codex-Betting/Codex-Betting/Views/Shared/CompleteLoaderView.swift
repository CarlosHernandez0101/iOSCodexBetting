//
//  CompleteLoaderView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/05/22.
//

import SwiftUI

struct CompleteLoaderView: View {
    
    @State var isLoading: Bool = true
    
    var body: some View {
        VStack {

            Circle()
                .trim(from: 0, to: 0.37)
                .stroke(Color.codexGolden, lineWidth: 5)
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
            
            Text("Cargando..")
                .foregroundColor(.white)
                .font(.system(size: 12))
                .fontWeight(.thin)
                .onAppear() {
                    withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                        isLoading.toggle()
                    }
                }
        }
        .background(Color.codexBlack)
    }
}

struct CompleteLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteLoaderView()
    }
}
