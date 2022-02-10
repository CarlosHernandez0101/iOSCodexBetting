//
//  LockFeatureView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 06/02/22.
//

import SwiftUI

struct LockFeatureView: View {
    
    private let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "lock.fill")
                .foregroundColor(.white)
                .font(.system(size: 32))
            
            Text(TextConstants.InformativeCards.LockFeature.description)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
            
            
            Button(action: {
                action()
            }) {
                Text(TextConstants.InformativeCards.LockFeature.begin)
                    .foregroundColor(.white)
                    .bold()
                    .underline()
            }
        }
    }
}

struct LockFeatureView_Previews: PreviewProvider {
    
    static func testPreview() {}
    
    static var previews: some View {
        ZStack {
            Color.codexGray
            LockFeatureView(action: testPreview)
        }
        .previewLayout(.sizeThatFits)
    }
}
