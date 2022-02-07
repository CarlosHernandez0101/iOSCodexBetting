//
//  LessonsView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LessonsView: View {
    var body: some View {
        ZStack {
            
            Color.codexBlack
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                LeadingTitle(title: "Lecciones")
                
                LessonCards()
            }            
        }
    }
}

struct LessonsView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsView()
    }
}
