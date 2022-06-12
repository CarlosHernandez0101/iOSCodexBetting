//
//  LessonCards.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LessonCards: View {
    @StateObject private var viewModel: LessonCardsViewModel
    
    init(viewModel: LessonCardsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            if viewModel.hasError {
                NetworkErrorView(action: viewModel.getVideos)
            } else if viewModel.isLoadingVideos {
                CompleteLoaderView()
                    .padding(.top, 100)
            } else {
                ForEach(viewModel.courseVideos, id: \.id) { courseVideo in
                    CourseVideoCardView(
                        lessonTitle: courseVideo.title,
                        lessonDescription: courseVideo.description,
                        lessonURL: courseVideo.url
                    )
                }
            }
        }
        .background(Color.codexBlack)
        .onAppear {
            viewModel.getVideos()
        }
    }
}

struct LessonCards_Previews: PreviewProvider {
    static var previews: some View {
        LessonCards(
            viewModel: LessonCardsViewModel(
                repository: VideoCourseRepository(network: CourseVideosNetwork(), db: VideoDatabase())
            )
        )
    }
}
