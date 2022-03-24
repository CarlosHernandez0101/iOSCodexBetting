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
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                
                LeadingTitle(title: TextConstants.Lessons.title)
                
                LessonCards(
                    viewModel: LessonCardsViewModel(
                        repository: VideoCourseRepository()
                    )
                )
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .background(
            Color.codexBlack.edgesIgnoringSafeArea(.all)
        )
    }
    
}

struct LessonsView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsView()
    }
}
