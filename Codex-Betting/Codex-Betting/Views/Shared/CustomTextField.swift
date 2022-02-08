//
//  CustomTextField.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 07/02/22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding private var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    var body: some View {        
        TextField("", text: $text)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("Hola"))
            .previewLayout(.sizeThatFits)
    }
}
