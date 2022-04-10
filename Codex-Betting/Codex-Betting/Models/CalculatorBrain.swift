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

        
        let result = calculateMatchedBettingOperation(
            backStake: backStake,
            backOdds: backOdds,
            layOdds: layOdds,
            layCommision: layCommision
        )
        
        return result-(result*backCommision/100)
    }
    
    public func getLiability(moneyToBet: Double, layOdds: Double) -> Double {
        (moneyToBet*layOdds)-moneyToBet
    }
            
    private func calculateMatchedBettingOperation(backStake: Double,
                                                  backOdds: Double,
                                                  layOdds: Double,
                                                  layCommision: Double) -> Double {
        
        (backOdds*backStake-(0*((backOdds-1)*backStake)/100)-backStake)/(layOdds-layCommision/100)
    }
    
    public func getLeftSideSportbook(backStake: Double, backOdds: Double, backCommision: Double) -> Double {
        let benefit = calculateSportbookBenefit(backStake: backStake, backOdds: backOdds)
        
        return benefit-(benefit*backCommision/100)
    }
    
    public func getRightSideSportbook() -> Double {
        return 0
    }
    
    public func getLeftSideExhange(moneyToBet: Double, layCommision: Double) -> Double {
        moneyToBet-(moneyToBet*layCommision/100)
    }
    
    public func getSportbookTotal(leftSidesSportBook: Double, rightSideExchange: Double) -> Double {
        leftSidesSportBook + rightSideExchange
    }
    
    public func getExchangeTotal(leftSideExchange: Double, rightSideSportbook: Double) -> Double {
        return leftSideExchange + rightSideSportbook
    }
    
    private func calculateSportbookBenefit(backStake: Double, backOdds: Double) -> Double {
        (backStake * backOdds)-backStake
    }
    
}
