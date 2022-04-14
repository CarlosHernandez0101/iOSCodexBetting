//
//  AmericanOddPicker.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 08/02/22.
//

import SwiftUI

struct AmericanOddPicker: View {
    
    @Binding private var americanOdd: AmericanOddType
    
    init(americanOdd: Binding<AmericanOddType>) {
        self._americanOdd = americanOdd
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = UIColor(Color.codexGolden)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
    }
    
    var body: some View {
        Picker("", selection: $americanOdd) {
            Text("+").tag(AmericanOddType.positive)
            Text("-").tag(AmericanOddType.negative)
        }
        .pickerStyle(.segmented)
        .frame(width: 80)
    }
}

struct AmericanOddPicker_Previews: PreviewProvider {
    static var previews: some View {
        AmericanOddPicker(americanOdd: .constant(.positive))
            .previewLayout(.sizeThatFits)
    }
}
