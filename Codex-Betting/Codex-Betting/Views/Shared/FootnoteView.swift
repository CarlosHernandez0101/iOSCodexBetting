//
//  FootnoteView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import SwiftUI

struct FootnoteView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                
                Text("Importante")
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical)
            
            
            HStack {
                Text("Por razones de derechos de autor los videos están protegidos, por lo que deberás iniciar sesión con el correo que utilizó al comprar el curso. Si tiene problemas contacte a servicio al cliente.")
                    .foregroundColor(.codexGray)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
            .padding(.leading)
            .padding(.vertical, 20)
                        
        }
        .background(Color.codexBlack)
    }
}

struct FootnoteView_Previews: PreviewProvider {
    static var previews: some View {
        FootnoteView()
            .previewLayout(.sizeThatFits)
    }
}
