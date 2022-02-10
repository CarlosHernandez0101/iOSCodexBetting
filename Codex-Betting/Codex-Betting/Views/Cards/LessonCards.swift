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
            LessonCardView(
                lessonNumber: "1",
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            LessonCardView(
                lessonNumber: "1",
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            LessonCardView(
                lessonNumber: "1",
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            LessonCardView(
                lessonNumber: "1",
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
            
            LessonCardView(
                lessonNumber: "1",
                lessonTitle: "Apuestas",
                lessonDescription: "Aprende que es una apuesta"
            )
        }
    }
}

struct LessonCards_Previews: PreviewProvider {
    static var previews: some View {
        LessonCards()
    }
}
