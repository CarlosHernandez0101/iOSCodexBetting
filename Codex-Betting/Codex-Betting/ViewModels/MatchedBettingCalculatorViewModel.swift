//
//  MatchedBettingCalculatorViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 02/04/22.
//

import Foundation

final class MatchedBettingCalculatorViewModel: ObservableObject {
    @Published var backStake: String = ""
    @Published var backOdds: String = ""
    @Published var backCommision: String = "0"
    @Published var layOdds: String = ""
    @Published var layCommision: String = ""
    @Published var moneyToBet: Double = 0.0
    @Published var liability: Double = 0.0
    @Published var leftSideSportBook: String = "0.00"
    @Published var rightSideSportBook: String = "0.00"
    @Published var totalSportBook: String = "0.00"
    @Published var leftSideExchange: String = "0.00"
    @Published var rightSideExchange: String = "0.00"
    @Published var totalExchange: String = "0.00"
    @Published var isPositiveProfit: Bool = true
    @Published var totalProfit: String = "0.0"
    @Published var calculatorSelection: CalculatorSelection = .normal {
        didSet {
            self.calculate()
        }
    }
    
    private let calculator: CalculatorBrain = CalculatorBrain()
    
    public func calculate() {
        
        guard let backStake = backStake.double else {
            backStake = ""
            return
        }
        
        guard let backOdds = backOdds.double else {
            backOdds = ""
            return
        }
        
        guard let backCommision = backCommision.double else {
            backCommision = ""
            return
        }
        
        guard let layOdds = layOdds.double else {
            layOdds = ""
            return
        }
        
        guard let layCommision = layCommision.double else {
            layCommision = ""
            return
        }
        
        switch calculatorSelection {
        case .normal:
            
            let moneyToBetResult = self.calculator.getMoneyToBet(backStake: backStake, backOdds: backOdds, backCommision: backCommision, layOdds: layOdds, layCommision: layCommision)
            
            self.moneyToBet = moneyToBetResult.rounded(digits: 2)
            
            let liabilityResult = self.calculator.getLiability(moneyToBet: moneyToBetResult, layOdds: layOdds)
            
            self.liability = liabilityResult.rounded(digits: 2)
            
            let leftSideSportbookResult = self.calculator.getLeftSideSportbook(backStake: backStake, backOdds: backOdds, backCommision: backCommision)
            
            self.leftSideSportBook = String(leftSideSportbookResult.rounded(digits: 2))
            
            let exchangeLeftSideResult = self.calculator.getLeftSideExchange(backStake: backStake)
            
            self.leftSideExchange = String(exchangeLeftSideResult.rounded(digits: 2))
            
            let sportbookRightSideResult = self.calculator.getRightSideSportbook(liability: liability)
            
            self.rightSideSportBook = String(sportbookRightSideResult.rounded(digits: 2))
            
            let rightSideExchangeResult = self.calculator.getRightSideExchangeForFreebet(moneyToBet: moneyToBetResult, layCommision: layCommision)
            
            self.rightSideExchange = String(rightSideExchangeResult.rounded(digits: 2))
            
            let totalSportBookResult = self.calculator.getTotalProfitSportbook(leftSideSportbook: leftSideSportbookResult, rightSideSportbook: sportbookRightSideResult)
            
            self.totalSportBook = String(totalSportBookResult.rounded(digits: 2))
            
            let totalExchangeResult = self.calculator.getTotalProfitExchange(leftSideExchange: exchangeLeftSideResult, rightSideExchage: rightSideExchangeResult)
            
            self.totalExchange = String(totalExchangeResult.rounded(digits: 2))
            
            self.totalProfit = totalExchangeResult > totalSportBookResult ? totalExchange : totalSportBook
            
            self.isPositiveProfit = totalExchangeResult > 0
            
        case .freebet:
            
            let moneyToBetResult = self.calculator.getMoneyToBetForFreebet(
                backStake: backStake,
                backOdds: backOdds,
                backCommision: backCommision,
                layOdds: layOdds,
                layCommision: layCommision
            )
            
            self.moneyToBet = moneyToBetResult.rounded(digits: 2)
            
            let liabilityResult = self.calculator.getLiabilityFreebet(moneyToBet: moneyToBetResult, layOdds: layOdds)
            
            self.liability = liabilityResult.rounded(digits: 2)
            
            let leftSideSportbook = self.calculator.getLeftSideSportbookForFreebet(backStake: backStake, backOdds: backOdds, backCommision: backCommision)
            
            self.leftSideSportBook = String(leftSideSportbook)
            
            let rightSideSportBookResult = self.calculator.getRightSideSportbookForFreebet(liability: liability)
            
            self.rightSideSportBook = String(rightSideSportBookResult)
            
            let leftSideExchangeResult = self.calculator.getLeftSideExhangeForFreebet()
            
            self.leftSideExchange = String(leftSideExchangeResult.rounded(digits: 2))
            
            let rightSideExcahngeResult = self.calculator.getRightSideExchangeForFreebet(moneyToBet: moneyToBetResult, layCommision: layCommision)
            
            self.rightSideExchange = String(rightSideExcahngeResult.rounded(digits: 2))
            
            let sportbookTotalResult = self.calculator.getSportbookTotalForFreebet(
                leftSidesSportBook: leftSideSportbook,
                rightSideSportbook: rightSideSportBookResult
            )
            
            self.totalSportBook = String(sportbookTotalResult.rounded(digits: 2))
            
            let exchangeTotalResult = self.calculator.getExchangeTotalForFreebet(leftSideExchange: leftSideExchangeResult, rightSideExchange: rightSideExcahngeResult)
            
            self.totalExchange = String(exchangeTotalResult.rounded(digits: 2))
            
            self.totalProfit = exchangeTotalResult > sportbookTotalResult ? totalExchange : totalSportBook
            
            self.isPositiveProfit = exchangeTotalResult > 0
                        
        }
    }
}
