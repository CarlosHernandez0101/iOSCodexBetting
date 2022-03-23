//
//  SwiftUIView.swift
//  Codex-Betting
//
//  Created by Casai User on 18/03/22.
//

import SwiftUI

struct SwiftUIView: View {
    @State var currentSelection: Int = 0
    var body: some View {
        TabView(selection: $currentSelection) {
            VStack {
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
