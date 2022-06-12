//
//  MatchedBettingCalculatorView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct MatchedBettingCalculatorView: View {
    @StateObject private var viewModel: MatchedBettingCalculatorViewModel
    
    init(viewModel: MatchedBettingCalculatorViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            
            SuccessAlertView(
                text: TextConstants.VerifyBet.betAlertText,
                isPresented: $viewModel.showSuccessAlert
            )
                .zIndex(1)
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                    .padding(.leading, 16)
                
                LeadingText(text: "Tipo de apuesta")
                    .padding(.leading, 16)
                
                CalculatorSelectorView(currentSelection: $viewModel.calculatorSelection)
                
                BackBetView(
                    backStakeText: $viewModel.backStake,
                    backOddsText: $viewModel.backOdds,
                    backCommision: $viewModel.backCommision,
                    calculate: viewModel.calculate
                )
                    .padding(.top, 32)
                
                LayBetView(
                    layOddsText: $viewModel.layOdds,
                    layCommisionText: $viewModel.layCommision,
                    calculate: viewModel.calculate
                )
                    .padding(.top, 16)
                
                LayStakeRequiredView(moneyToBet: viewModel.moneyToBet, copyAction: viewModel.copyToClipboard)
                    .padding(.top, 16)
                
                LiabilityView(liability: viewModel.liability)
                    .padding(.top, 8)
                
                VStack {
                    BreakdownView(
                        leftSideSportBook: viewModel.leftSideSportBook,
                        rightSideSportBook: viewModel.rightSideSportBook,
                        totalSportBook: viewModel.totalSportBook,
                        leftSideExchange: viewModel.leftSideExchange,
                        rightSideExchange: viewModel.rightSideExchange,
                        totalExchange: viewModel.totalExchange
                    )
                        .padding(.top, 32)
                    
                    ResultView(
                        isPositive: viewModel.isPositiveProfit,
                        total: viewModel.totalProfit
                    )
                        .padding(.top, 32)
                        .padding(.bottom, 50)
                }
                
                VStack {

                    OpenVerifyBetButton(showVerifyBet: $viewModel.showVerifyBet)
                        .padding(.bottom)
                    
                    if viewModel.showVerifyBet {
                        RequirementsView(requeriments: $viewModel.verifyBetRequeriments)
                    }
                }
                
            }
            .padding(.top, 1)
            .padding(.horizontal, 16)
        }
        .background(Color.codexBlack.edgesIgnoringSafeArea(.all))
        .onTapGesture {
            UIApplication.shared.endEditing()
            viewModel.calculate()
        }
    }
}

struct MatchedBettingCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedBettingCalculatorView(viewModel: MatchedBettingCalculatorViewModel())
    }
}
