//
//  VerifyBetOptionsView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct VerifyBetOptionsView: View {
    @StateObject private var viewModel: VerifyBetOptionsViewModel
    
    init(viewModel: VerifyBetOptionsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            
            NavigationLink(isActive: $viewModel.presentVerify) {
                VerifyBetView(
                    viewModel: VerifyBetViewModel(
                        currentSelection: viewModel.currenVerifySelection
                    )
                )
            } label: {
                EmptyView()
            }
            
            CodexToolBar()
            
            VStack {
                
                LeadingTitle(title: TextConstants.VerifyBet.title)
                    .padding(.leading)
                
                VerifyBetSelectorView(currentSelection: $viewModel.currenVerifySelection)
                
                ContinueButton(
                    buttonText: TextConstants.VerifyBet.continueText,
                    action: viewModel.goToVerify,
                    isDisabled: .constant(false)
                )
                
                Spacer()
            }
            .padding(.top, 64)
        }
        .padding()
        .background(Color.codexBlack.edgesIgnoringSafeArea(.all))
    }
}

struct VerifyBetOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyBetOptionsView(
            viewModel: VerifyBetOptionsViewModel()
        )
    }
}
