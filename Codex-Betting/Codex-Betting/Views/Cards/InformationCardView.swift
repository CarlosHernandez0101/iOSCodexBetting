//
//  InformationCardView.swift
//  Codex-Betting
//
//  Created by Hernández on 05/02/22.
//

import SwiftUI

struct InformationCardView: View {
    
    private let cardTitle: String
    private let cardImage: String
    private let cardDescription: String
    private let feedback = UINotificationFeedbackGenerator()
    @State var isLocked: Bool = false
    
    @StateObject private var viewModel: InformationCardViewModel
    
    init(
        cardTitle: String,
        cardImage: String,
        cardDescription: String,
        viewModel: InformationCardViewModel
    ) {
        self.cardTitle = cardTitle
        self.cardImage = cardImage
        self.cardDescription = cardDescription
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            
            Group {
                NavigationLink(destination: LessonsView()
                                .navigationBarHidden(true),
                               tag: InformationCardViewModel.Router.lessons,
                               selection: $viewModel.route,
                               label: { EmptyView() }
                )
                
                NavigationLink(destination: ToolsView()
                                .navigationBarHidden(true),
                               tag: InformationCardViewModel.Router.tools,
                               selection: $viewModel.route,
                               label: { EmptyView() }
                )
                
                NavigationLink(destination: MatchedBettingGameForm(
                    viewModel: MatchedBettingGameFormViewModel(requestsManager: MatchRequestsManager())
                )
                                .navigationBarHidden(true),
                               tag: InformationCardViewModel.Router.match,
                               selection: $viewModel.route,
                               label: { EmptyView() }
                )
                
                NavigationLink(destination: MatchedBettingCalculatorView()
                                .navigationBarHidden(true),
                               tag: InformationCardViewModel.Router.calculator,
                               selection: $viewModel.route,
                               label: { EmptyView() }
                )
                
                NavigationLink(
                    destination: VerifyBetOptionsView(
                        viewModel: VerifyBetOptionsViewModel()
                    )
                                .navigationBarHidden(true),
                               tag: InformationCardViewModel.Router.verifyBet,
                               selection: $viewModel.route,
                               label: { EmptyView() }
                )
                
                NavigationLink(destination: OddsConverterView()
                                .navigationBarHidden(true),
                               tag: InformationCardViewModel.Router.oddsConverter,
                               selection: $viewModel.route,
                               label: { EmptyView() }
                )
            }

            
            HStack {
                
                Text(cardTitle)
                    .foregroundColor(.white)
                    .font(
                        Font.custom(
                            HKGrotesk.bold.rawValue,
                            size: 30
                        )
                    )
                    .padding(.top, 32)
                    .fixedSize(horizontal: false, vertical: true)
                                
                Spacer()
                
                Image(systemName: cardImage)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding(.top, 32)
                
            }
            
            CustomDivider(dividerColor: .codexGolden)
                .opacity(0.8)
            
            
            if viewModel.showLockedFeature {
                LockFeatureView(action: viewModel.openURLToBuyCourse)
                    .padding(.vertical, 32)
            } else {
                Text(cardDescription)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.white)
                    .padding(.vertical, 32)
            }
        }
        .onTapGesture {
            withAnimation {
                viewModel.didTapInformativeCard()
                if viewModel.showLockedFeature {
                    feedback.notificationOccurred(.error)
                }
            }
        }
        .padding(.horizontal, 16)
        .background(Color.codexGray)
        .cornerRadius(15)
        
    }
}

struct InformationCardView_Previews: PreviewProvider {
    
    static func testPreview() { }
    
    static var previews: some View {
        InformationCardView(
            cardTitle: "Lecciones", 
            cardImage: "book",
            cardDescription: "Aquí encontrarás todas las lecciones del curso y mucho más",
            viewModel: InformationCardViewModel(
                informationCard: InformationCardModel(
                    title: "Lecciones",
                    image: "book",
                    description: "",
                    isEnabledByDefault: false,
                    cardType: .lessons
                )                
            )
        )
            .previewLayout(.sizeThatFits)
    }
}
