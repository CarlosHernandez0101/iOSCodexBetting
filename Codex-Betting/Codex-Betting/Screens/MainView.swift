//
//  MainView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 05/02/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                
                Color.codexBlack
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    
                    Image(ImageConstants.codexLogo)
                        .resizable()
                        .frame(width: 250, height: 250, alignment: .center)
                    
                    InformationCards(
                        viewModel: InformationCardsViewModel()
                    )
                }
                .padding(.vertical, 32)
                .edgesIgnoringSafeArea(.top)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
