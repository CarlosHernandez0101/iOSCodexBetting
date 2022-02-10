//
//  ContentView.swift
//  DateTest
//
//  Created by Casai User on 09/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var today = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .day, value: 180, to: startDate)
        return startDate
            ...
            endDate!
    }()
    
    var body: some View {
        DatePicker(
            "Check-in",
            selection: $today,
            in: dateRange,
            displayedComponents: .date
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
