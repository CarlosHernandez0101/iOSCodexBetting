//
//  OddsConverterViewModel.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 13/04/22.
//

import Foundation

final class OddsConverterViewModel: ObservableObject {
    
    @Published var americanOdd: String = ""
    @Published var americanOddType: AmericanOddType = .positive
    @Published var decimalOdd: String = "0"
    
    private let calculator = CalculatorBrain()
    
    public func convertAmericanOdd() {
        guard let americanOdd = americanOdd.double else {
            return
        }
        
        decimalOdd = String(
            self.calculator.convertAmericanToDecimalOdd(americanOdd, type: americanOddType).rounded(digits: 2)
        )
    }
    
}
