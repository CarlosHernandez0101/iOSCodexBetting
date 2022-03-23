//
//  MatchedBettingGameForm.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct MatchedBettingGameForm: View {
    
    @StateObject private var viewModel: MatchedBettingGameFormViewModel
    
    init(viewModel: MatchedBettingGameFormViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    private func test() {}
    
    var body: some View {
//        Background {
            ZStack {
                Color.codexBlack
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    
                    CodexToolBar()
                    
                    MatchedBettingGameFormHeader()
                    
                    VStack {
                        
                        LeadingText(text: TextConstants.MatchedBettingGameForm.askText)
                            .padding(.top, 32)
                        
                        MultiOptionSelectorView(currentSelection: $viewModel.currentMatchedBettingGameSelection)
                        
                        if viewModel.showMatchedBettingTextField {
                            CodexTextField(
                                text: $viewModel.matchedBettingGameText,
                                placeholder: viewModel.matchedBettingGamePlaceholder,
                                keyboardType: .default,
                                disableAutocorrection: false
                            )
                        }
                        
                        CustomDivider(dividerColor: .codexGray)
                    }
                    
                    
                    if !viewModel.showOnlyRequestButton {
                        VStack {
                            
                            LeadingText(text: TextConstants.MatchedBettingGameForm.oddsText)
                                .padding(.top, 32)
                                .padding(.bottom, 16)
                            
                            OddsInput(
                                minimumOdd: $viewModel.minimumOdd,
                                maximumOdd: $viewModel.maximumOdd
                            )
                            
                            CustomDivider(dividerColor: .codexGray)
                        }
                        
                        
                        VStack {
                            LeadingText(text: TextConstants.MatchedBettingGameForm.datesText)
                                .padding(.top, 32)
                            
                            DatesInput(startDate: $viewModel.gameStartDate, endDate: $viewModel.gameEndDate)
                        }
                        
                        VStack {
                            CustomDivider(dividerColor: .codexGray)
                                .padding(.vertical, 32)
                            
                            LeadingText(text: TextConstants.MatchedBettingGameForm.spoortBookText)
                            
                            CodexTextField(
                                text: $viewModel.spoortbookSelected,
                                placeholder: viewModel.spoortbookPlaceholder,
                                keyboardType: .default,
                                disableAutocorrection: false
                            )
                            
                        }
                    }
                                        
                    ContinueButton(
                        buttonText: TextConstants.MatchedBettingGameForm.Button.sendRequest,
                        action: test,
                        isDisabled: $viewModel.disableRequestButton
                    )
                        .padding(.bottom, 150)
                        .padding(.top, 32)
                    
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 32)
            }
            .sheet(isPresented: $viewModel.isPresentedRecommendations) {
                if viewModel.isPresentedRecommendations {
                    RecommendationView(
                        viewModel: RecommendationViewModel(),
                        isPresented: $viewModel.isPresentedRecommendations
                    )
                }
            }
//        }
//        .onTapGesture {
//            UIApplication.shared.endEditing()
//        }
    }
}

struct MatchedBettingGameForm_Previews: PreviewProvider {
    static var previews: some View {
        MatchedBettingGameForm(viewModel: MatchedBettingGameFormViewModel())
    }
}
