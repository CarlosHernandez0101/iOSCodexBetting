//
//  VideoDetailView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 24/03/22.
//

import SwiftUI

struct VideoDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private let lessonTitle: String
    private let lessonDescription: String
    private let lessonURL: URL?
    
    init(lessonTitle: String, lessonDescription: String, lessonURL: URL?) {
        self.lessonTitle = lessonTitle
        self.lessonDescription = lessonDescription
        self.lessonURL = lessonURL
    }
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                VideoView(url: lessonURL)
                
                HStack {
                    VStack {
                        
                        HStack {
                            Text(lessonTitle)
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                        }
                        
                        
                        HStack {
                            Text(lessonDescription)
                                .foregroundColor(.codexGray)
                                .padding(.top, 8)
                                .lineLimit(3)
                            
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 32)
                
//                FootnoteView()
                
            }
            .background(Color.codexBlack)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    BackButtonView()
                }
        )
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(lessonTitle: "Apuestas", lessonDescription: "Aprende que son las apuestas", lessonURL: URL(string: "https://youtu.be/J2AXjucNm_E"))
    }
}
