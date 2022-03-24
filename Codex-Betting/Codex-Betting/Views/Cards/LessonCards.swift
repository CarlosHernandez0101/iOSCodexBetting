//
//  LessonCards.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LessonCards: View {
    var body: some View {
        VStack {
            CourseVideoCardView(
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            CourseVideoCardView(
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            CourseVideoCardView(
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            CourseVideoCardView(
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            CourseVideoCardView(
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
        }
        .background(Color.codexBlack)
    }
}

struct LessonCards_Previews: PreviewProvider {
    static var previews: some View {
        LessonCards()
    }
}
