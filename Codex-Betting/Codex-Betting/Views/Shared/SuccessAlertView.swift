//
//  SuccessAlertView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 25/03/22.
//

import SwiftUI

struct SuccessAlertView: View {
    
    private let text: String
    @Binding private var isPresented: Bool
    
    private let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    
    init(text: String, isPresented: Binding<Bool>) {
        self.text = text
        self._isPresented = isPresented
    }
    
    private func dismissAlert() {
        self.isPresented = false
    }

    var body: some View {
        ZStack {
            
            Color.black.opacity(0.7)
            
            VStack(spacing: 32) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 40))
                    .padding(.top)
                
                Text(text)
                    .foregroundColor(.white)
                    .font(Font.custom(HKGrotesk.regular.rawValue, size: 25))
                    .padding(.horizontal)
                
                Button(action: {
                    self.isPresented = false
                }) {
                    ContinueButton(
                        buttonText: "OK",
                        action: dismissAlert,
                        isDisabled: .constant(false)
                    )
                        .fixedSize(horizontal: true, vertical: false)
                }
                .padding()
            }
            .background(Color.codexGray)
            .cornerRadius(8)
        }
        .offset(x: 0, y: isPresented ? 0 : window?.frame.height ?? 0)
        .animation(.easeOut)
        .transition(.opacity)
        .edgesIgnoringSafeArea(.all)

    }
}

struct SuccessAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessAlertView(
            text: "Es seguro hacer su apuesta",
            isPresented: .constant(true)
        )
    }
}
