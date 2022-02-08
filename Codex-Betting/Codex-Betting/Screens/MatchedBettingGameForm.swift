//
//  MatchedBettingGameForm.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct MatchedBettingGameForm: View {
    
    @State var showingSheet: Bool = false
    @State var textFieldText: String = ""
    
    var body: some View {
        ZStack {
            Color.codexBlack
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                VStack {
                    LeadingTitle(title: "Solicitar partido")
                    
                    CustomDivider(dividerColor: .codexGray)
                    
                    LeadingText(text: "Solicitar")
                        .padding(.top, 32)
                }
                
                
                MultiOptionSelectorView()
                
                //TODO: Add text field here
                
                CustomDivider(dividerColor: .codexGray)
                
                LeadingText(text: "Cuotas")
                    .padding(.top, 32)
                
                CustomDivider(dividerColor: .codexGray)
                
                LeadingText(text: "Fechas")
                    .padding(.top, 32)
                
                VStack(spacing: 8) {
                    DatePicker(
                        "Desde",
                        selection: .constant(Date()),
                        displayedComponents: [.date, .hourAndMinute]
                    )
                        .background(Color.codexGolden)
                        .foregroundColor(.black)
                        .accentColor(.codexGolden)
                        .cornerRadius(15)
                    
                    DatePicker(
                        "Hasta",
                        selection: .constant(Date()),
                        displayedComponents: [.date, .hourAndMinute]
                    )
                        .background(Color.codexGolden)
                        .foregroundColor(.black)
                        .accentColor(.codexGolden)
                        .cornerRadius(15)
                }
                
                CustomDivider(dividerColor: .codexGray)
                    .padding(.vertical, 32)
                
                LeadingText(text: "Casa de apuestas")
                
            }
            .padding(.horizontal, 16)
            
        }
        .sheet(isPresented: $showingSheet) {
            RecommendationView(isPresented: $showingSheet)
        }
    }
}

struct MatchedBettingGameForm_Previews: PreviewProvider {
    static var previews: some View {
        MatchedBettingGameForm()
    }
}
