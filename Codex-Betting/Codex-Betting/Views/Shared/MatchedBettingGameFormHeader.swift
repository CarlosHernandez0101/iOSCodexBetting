//
//  MatchedBettingGameFormHeader.swift
//  Codex-Betting
//
//  Created by Casai User on 18/02/22.
//

import SwiftUI

struct MatchedBettingGameFormHeader: View {
    var body: some View {
        VStack {
            LeadingTitle(title: TextConstants.MatchedBettingGameForm.title)
            
            CustomDivider(dividerColor: .codexGray)            
        }
    }
}

struct MatchedBettingGameFormHeader_Previews: PreviewProvider {
    static var previews: some View {
        MatchedBettingGameFormHeader()
    }
}
