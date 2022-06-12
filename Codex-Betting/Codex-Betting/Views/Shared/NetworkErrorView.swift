//
//  NetworkErrorView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 16/05/22.
//

import SwiftUI

struct NetworkErrorView: View {
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 25) {
            
            Image(systemName: "wifi.exclamationmark")
                .foregroundColor(.white)
                .font(.system(size: 25))
            
            NormalText(text: "Ocurrió un error inesperado.")
            
            NormalText(text: "Verifique su conexión a internet o intente más tarde")
                .multilineTextAlignment(.center)
            
            ContinueButton(
                buttonText: "Reintentar",
                action: action,
                isDisabled: .constant(false)
            )
        }
        .padding()
        .background(Color.codexBlack)
    }
}

struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorView(action: {})
    }
}
