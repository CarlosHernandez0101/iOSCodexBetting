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
    
    public func getRightSideSportbookForFreebet() -> Double {
        return 0
    }
    
    public func getLeftSideExhangeForFreebet(moneyToBet: Double, layCommision: Double) -> Double {
        moneyToBet-(moneyToBet*layCommision/100)
    }
    
    public func getSportbookTotalForFreebet(leftSidesSportBook: Double, rightSideExchange: Double) -> Double {
        leftSidesSportBook + rightSideExchange
    }
    
    public func getExchangeTotalForFreebet(leftSideExchange: Double, rightSideSportbook: Double) -> Double {
        return leftSideExchange + rightSideSportbook
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
    
}
