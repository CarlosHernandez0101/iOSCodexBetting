//
//  DeleteAccountView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 18/06/22.
//

import SwiftUI

struct DeleteAccountView: View {
    
    @StateObject private var viewModel: DeleteAccountViewModel
    
    init(viewModel: DeleteAccountViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            CodexToolBar()
            
            LeadingTitle(title: "Borrar cuenta")
            
            LeadingText(text: "")
            
            LeadingText(text: "")
            
            LeadingText(text: "")
            
            LeadingText(text: "")
            
            ContinueButton(
                buttonText: "Borrar cuenta",
                action: {
                    viewModel.showAlert = true
                },
                isDisabled: .constant(false)
            )
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(
                title: Text("Borrar cuenta"),
                message: Text("Estás a punto de borrar tu cuenta, esta acción no se puede deshacer"),
                primaryButton: .default(Text("Cancelar"), action: {
                    viewModel.showAlert = false
                }),
                secondaryButton: .destructive(Text("Borrar"), action: {
                    
                })
            )
        })
        .padding(.horizontal, 16)
        .background(Color.codexBlack)
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView(viewModel: DeleteAccountViewModel())
    }
}
