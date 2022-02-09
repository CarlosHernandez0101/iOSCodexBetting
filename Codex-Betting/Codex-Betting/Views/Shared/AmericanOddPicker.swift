//
//  AmericanOddPicker.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 08/02/22.
//

import SwiftUI

struct AmericanOddPicker: View {
    
    @Binding private var americanOdd: Int
    
    init(americanOdd: Binding<Int>) {
        self._americanOdd = americanOdd
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = UIColor(Color.codexGolden)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
    }
    
    var body: some View {
        Picker("", selection: $americanOdd) {
            Text("+").tag(0)
            Text("-").tag(1)
        }
        .pickerStyle(.segmented)
        .frame(width: 80)
    }
}

struct AmericanOddPicker_Previews: PreviewProvider {
    static var previews: some View {
        AmericanOddPicker(americanOdd: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
