//
//  CustomDivider.swift
//  Codex-Betting
//
//  Created by Hernández on 05/02/22.
//

import SwiftUI

struct CustomDivider: View {
    
    private let dividerColor: Color
    
    init(dividerColor: Color) {
        self.dividerColor = dividerColor
    }
    
    var body: some View {
        Rectangle()
            .frame(height: 2, alignment: .center)
            .foregroundColor(dividerColor)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider(dividerColor: .white)
            .previewLayout(.sizeThatFits)
    }
}
