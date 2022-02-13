//
//  CodexToolBar.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/02/22.
//

import SwiftUI

struct CodexToolBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack {
                
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                Image(ImageConstants.codexLogo)
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    
            }
            Spacer()
        }
        .background(Color.codexBlack)        
    }
}

struct CodexToolBar_Previews: PreviewProvider {
    static var previews: some View {
        CodexToolBar()
    }
}
