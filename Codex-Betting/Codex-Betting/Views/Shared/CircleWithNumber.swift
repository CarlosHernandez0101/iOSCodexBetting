//
//  CircleWithNumber.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct CircleWithNumber: View {
    
    private let number: String
    
    init(number: String) {
        self.number = number
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.codexGray)
            
            Text(number)
                .foregroundColor(.white)
        }
    }
}

struct CircleWithNumber_Previews: PreviewProvider {
    static var previews: some View {
        CircleWithNumber(number: "23")
    }
}
