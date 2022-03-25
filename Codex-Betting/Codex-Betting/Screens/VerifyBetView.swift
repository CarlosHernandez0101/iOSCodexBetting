//
//  VerifyBetView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct VerifyBetView: View {
    @StateObject private var viewModel: VerifyBetViewModel
    
    init(viewModel: VerifyBetViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
                                    
            SuccessAlertView(
                text: viewModel.alertText,
                isPresented: $viewModel.showSuccessAlert
            )
                .zIndex(1)            
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                
                RequirementsView(requeriments: $viewModel.requirements)
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical)
        .background(Color.codexBlack.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)        
    }
}

struct VerifyBetView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyBetView(viewModel: VerifyBetViewModel(currentSelection: .bet))
    }
}
