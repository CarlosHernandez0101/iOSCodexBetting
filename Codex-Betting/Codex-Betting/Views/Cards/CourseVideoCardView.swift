//
//  LessonCardView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct CourseVideoCardView: View {
        
    private let lessonTitle: String
    private let lessonDescription: String
    private let lessonURL: URL?
    private let duration: String
    @State private var showVideo = false
    
    init(lessonTitle: String,
         lessonDescription: String,
         lessonURL: String,
         duration: String
    ) {
        self.lessonTitle = lessonTitle
        self.lessonDescription = lessonDescription
        self.lessonURL = URL(string: lessonURL)
        self.duration = duration
    }
    
    
    var body: some View {
        VStack {
            
            NavigationLink(
                isActive: $showVideo) {
                    VideoDetailView(
                        lessonTitle: lessonTitle,
                        lessonDescription: lessonDescription,
                        lessonURL: lessonURL
                    )                        
                        
                } label: {
                    EmptyView()
                }

            
            HStack {
                
                Text(lessonTitle)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                Image(systemName: "play.circle.fill")
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)                    
            }
            
            HStack {
                Text(lessonDescription)
                    .foregroundColor(.codexGray)
                    .padding(.top, 8)
                .lineLimit(3)
                
                Spacer()
            }
            
            HStack {
                Text(duration)
                    .foregroundColor(.white)
                    .padding(.top, 1)
                .lineLimit(3)
                
                Spacer()
            }
            
            CustomDivider(dividerColor: .codexGray)
                .padding(.top, 16)
            
        }
        .padding(.top, 32)
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
        .background(Color.codexBlack)
        .onTapGesture {
            showVideo = true
        }
        
    }
}

struct LessonCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseVideoCardView(            
            lessonTitle: "¿Qué es una apuesta?",
            lessonDescription: "Aprende que es una apuesta y como hacerla es una apuesta",
            lessonURL: "",
            duration: "00:43"
        )
            .previewLayout(.sizeThatFits)
    }
}
