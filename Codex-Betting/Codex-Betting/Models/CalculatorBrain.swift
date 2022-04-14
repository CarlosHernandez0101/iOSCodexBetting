//
//  CalculatorBrain.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 02/04/22.
//

import Foundation

final class CalculatorBrain {
    
    public func getMoneyToBetForFreebet(backStake: Double,
                                        backOdds: Double,
                                        backCommision: Double,
                                        layOdds: Double,
                                        layCommision: Double) -> Double {

        
        let result = calculateMatchedBettingOperationForFreebet(
            backStake: backStake,
            backOdds: backOdds,
            layOdds: layOdds,
            layCommision: layCommision
        )
        
        return result-(result*backCommision/100)
    }
    
    public func getLiabilityFreebet(moneyToBet: Double, layOdds: Double) -> Double {
        (moneyToBet*layOdds)-moneyToBet
    }
            
    private func calculateMatchedBettingOperationForFreebet(backStake: Double,
                                                  backOdds: Double,
                                                  layOdds: Double,
                                                  layCommision: Double) -> Double {
        
        (backOdds*backStake-(0*((backOdds-1)*backStake)/100)-backStake)/(layOdds-layCommision/100)
    }
    
    public func getLeftSideSportbookForFreebet(backStake: Double, backOdds: Double, backCommision: Double) -> Double {
        let benefit = calculateSportbookBenefitForFreebet(backStake: backStake, backOdds: backOdds)
        
        return benefit-(benefit*backCommision/100)
    }
    
    public func getRightSideSportbookForFreebet(liability: Double) -> Double {
        return -liability
    }
    
    public func getLeftSideExhangeForFreebet() -> Double {
        return 0
    }
    
    public func getRightSideExchangeForFreebet(moneyToBet: Double, layCommision: Double) -> Double {
        return moneyToBet-(moneyToBet*layCommision/100)
    }
    
    public func getSportbookTotalForFreebet(leftSidesSportBook: Double, rightSideSportbook: Double) -> Double {
        return leftSidesSportBook + rightSideSportbook
    }
    
    public func getExchangeTotalForFreebet(leftSideExchange: Double, rightSideExchange: Double) -> Double {
        return leftSideExchange + rightSideExchange
    }
    
    private func calculateSportbookBenefitForFreebet(backStake: Double, backOdds: Double) -> Double {
        (backStake * backOdds)-backStake
    }
    
    public func getMoneyToBet(backStake: Double,
                              backOdds: Double,
                              backCommision: Double,
                              layOdds: Double,
                              layCommision: Double) -> Double {
        
        (backOdds*backStake-(0*((backOdds-1)*backStake)/100)-0)/(layOdds-layCommision/100)
    }
    
    public func getLiability(moneyToBet: Double, layOdds: Double) -> Double {
        return (moneyToBet*layOdds)-moneyToBet
    }
    
    public func getLeftSideSportbook(backStake: Double, backOdds: Double, backCommision: Double) -> Double {
        let result = calculateMatchedBettingOperation(backStake: backStake, backOdds: backOdds)
        
        return result-(result*backCommision/100)
    }
    
    public func getLeftSideExchange(backStake: Double) -> Double {
        return -backStake
    }
    
    public func getRightSideSportbook(liability: Double) -> Double {
        return -liability
    }
    
    public func getRightSideExchange(moneyToBet: Double, layCommision: Double) -> Double {
        return moneyToBet
    }
    
    public func getTotalProfitSportbook(leftSideSportbook: Double, rightSideSportbook: Double) -> Double {
        return leftSideSportbook + rightSideSportbook
    }
    
    public func getTotalProfitExchange(leftSideExchange: Double, rightSideExchage: Double) -> Double {
        return rightSideExchage + leftSideExchange
    }
    
    public func convertAmericanToDecimalOdd(_ americanOdd: Double, type: AmericanOddType) -> Double {
        switch type {
        case .positive:
            return (americanOdd/100) - 1
        case .negative:
            return (100 / americanOdd + 1).rounded(digits: 3)
        }
    }
    
    private func calculateMatchedBettingOperation(backStake: Double, backOdds: Double) -> Double {
        return (backStake*backOdds)-backStake
    }
    
}
