//
//  DatesInput.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 18/02/22.
//

import SwiftUI

struct DatesInput: View {
    
    @Binding private var startDate: Date
    @Binding private var endDate: Date
    
    private let DATE_LIMIT: Date = Calendar.current.date(byAdding: .month, value: 2, to: Date())!
    
    
    init(startDate: Binding<Date>, endDate: Binding<Date>) {
        self._startDate = startDate
        self._endDate = endDate
    }
    
    var body: some View {
        VStack(spacing: 8) {
            DatePicker(
                TextConstants.MatchedBettingGameForm.fromDateText,
                selection: $startDate,
                in: startDate...DATE_LIMIT,
                displayedComponents: [.date, .hourAndMinute]
            )
                .datePickerStyle(CompactDatePickerStyle())
                .foregroundColor(.white)
                .accentColor(.codexGolden)
                .cornerRadius(15)
                .colorMultiply(.white)
            
            DatePicker(TextConstants.MatchedBettingGameForm.toDateText,
                       selection: $endDate,
                       in: startDate...DATE_LIMIT,
                       displayedComponents: [.date, .hourAndMinute]
            )
                .datePickerStyle(CompactDatePickerStyle())
                .foregroundColor(.white)
                .accentColor(.codexGolden)
                .cornerRadius(15)
                .colorMultiply(.white)                
        }
    }
}

struct DatesInput_Previews: PreviewProvider {
    static var previews: some View {
        DatesInput(startDate: .constant(Date()), endDate: .constant(Date()))
    }
}
