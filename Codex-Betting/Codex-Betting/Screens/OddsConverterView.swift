//
//  OddsConverterView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 08/02/22.
//

import SwiftUI

struct OddsConverterView: View {
        
    @StateObject private var viewModel: OddsConverterViewModel
    
    init(viewModel: OddsConverterViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.codexBlack.edgesIgnoringSafeArea(.all)
            
            CodexToolBar()
                .padding(.leading, 16)
            
            VStack {
                
                NormalText(text: TextConstants.OddsConverter.americanOdd)
             
                HStack {

                    AmericanOddPicker(americanOdd: $viewModel.americanOddType)
                    
                    Spacer()
                    
                    CodexTextField(
                        text: $viewModel.americanOdd,
                        placeholder: "Ingrese la cuota",
                        keyboardType: .numberPad,
                        disableAutocorrection: true,
                        colorScheme: .dark
                    )
                        .frame(width: 200)
                                        
                }
                .padding(.horizontal, 40)
                
                NormalText(text: TextConstants.OddsConverter.decimalOdd)
                    .padding(.top, 32)
                
                NormalText(text: viewModel.decimalOdd)
                    .padding(.top, 16)
                
            }
            .padding(.horizontal, 16)
            
        }
        .onTapGesture {
            viewModel.convertAmericanOdd()
        }
    }
}

struct OddsConverterView_Previews: PreviewProvider {
    static var previews: some View {
        OddsConverterView(viewModel: OddsConverterViewModel())
    }
}
