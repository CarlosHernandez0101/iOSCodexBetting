//
//  LessonCardView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LessonCardView: View {
    
    private let lessonNumber: String
    private let lessonTitle: String
    private let lessonDescription: String
    
    init(lessonNumber: String, lessonTitle: String, lessonDescription: String) {
        self.lessonNumber = lessonNumber
        self.lessonTitle = lessonTitle
        self.lessonDescription = lessonDescription
    }
    
    
    var body: some View {
        VStack {
            
            HStack {
               
                CircleWithNumber(number: lessonNumber)
                
                Text(lessonTitle)
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            Text(lessonDescription)
                .foregroundColor(.codexGray)
                .padding(.top, 8)
            
            CustomDivider(dividerColor: .codexGray)
                .padding(.top, 16)
            
        }
        .padding(.top, 32)
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
        .background(Color.codexBlack)
    }
}

struct LessonCardView_Previews: PreviewProvider {
    static var previews: some View {
        LessonCardView(
            lessonNumber: "1",
            lessonTitle: "¿Qué es una apuesta?",
            lessonDescription: "Aprende que es una apuesta y como hacerla"
        )
            .previewLayout(.sizeThatFits)
    }
}
