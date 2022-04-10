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
            
            let rightSideSportBook = self.calculator.getRightSideSportbookForFreebet()
            
            self.rightSideSportBook = String(rightSideSportBook.rounded(digits: 2))
            
            let leftSideExchangeResult = self.calculator.getLeftSideExhangeForFreebet(moneyToBet: moneyToBetResult, layCommision: layCommision)
            
            self.leftSideExchange = String(leftSideExchangeResult.rounded(digits: 2))
            
            self.rightSideExchange = String(-self.liability)
            
            guard let rightSideExchangeDouble = rightSideExchange.double else {
                return
            }
            
            let sportbookTotalResult = self.calculator.getSportbookTotalForFreebet(leftSidesSportBook: leftSideSportbook, rightSideExchange: rightSideExchangeDouble)
            
            self.totalSportBook = String(sportbookTotalResult.rounded(digits: 2))
            
            let exchangeTotalResult = self.calculator.getExchangeTotalForFreebet(leftSideExchange: leftSideExchangeResult, rightSideSportbook: rightSideSportBook)
            
            self.totalExchange = String(exchangeTotalResult.rounded(digits: 2))
            
            self.totalProfit = exchangeTotalResult > sportbookTotalResult ? totalExchange : totalSportBook
            
            self.isPositiveProfit = exchangeTotalResult > 0
                        
        }
    }
}
