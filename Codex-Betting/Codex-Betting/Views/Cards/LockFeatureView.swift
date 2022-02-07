//
//  LockFeatureView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LockFeatureView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "lock.fill")
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            Text("Necesitas ser miembro de Codex Betting para acceder a esta funcionalidad")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Comprar")
                .foregroundColor(.white)
                .bold()
                .underline()
        }
    }
}

struct LockFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.codexGray
            LockFeatureView()
        }
        .previewLayout(.sizeThatFits)
    }
}
