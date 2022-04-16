//
//  LogInView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct LogInView: View {
    private let TEXT_FIELD_WIDTH = UIScreen.main.bounds.width - 120
    @State var textPassword = ""
    @State private var showRegister: Bool = false
    @State private var showForgetPassword: Bool = false
    
    @Binding var showLogin: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                
                NavigationLink(
                    isActive: $showRegister) {
                        RegisterView()
                    } label: {
                        EmptyView()
                    }
                
                NavigationLink(
                    isActive: $showForgetPassword) {
                        ForgetPasswordView()
                    } label: {
                        EmptyView()
                    }
                
                Color.codexBlack
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    
                    VStack {
                        Image(ImageConstants.codexLogo)
                            .resizable()
                        .frame(width: 250, height: 250, alignment: .center)
                        .scaledToFit()
                        .padding(.top, 25)
                        
                        Text("Iniciar sesión")
                            .foregroundColor(.white)
                            .font(
                                Font.custom(
                                    HKGrotesk.bold.rawValue,
                                    size: 32
                                )
                        )
                        
                        VStack {
                            
                            NormalText(text: "Correo eléctronico")
                            
                            CodexTextField(text: .constant(""), placeholder: "Ingrese su correo eléctronico", keyboardType: .emailAddress, disableAutocorrection: true, colorScheme: .light)
                                .frame(width: TEXT_FIELD_WIDTH)
                                
                            
                            NormalText(text: "Contraseña")
                            
                            VStack {
                                PasswordTextField(text: $textPassword, placeholder: "Ingrese su contraseña", colorScheme: .light)
                                    .frame(width: TEXT_FIELD_WIDTH)
                                
                                HStack {
                                    Spacer()
                                    
                                    UnderlinedButton(text: "¿Olvidaste tu contraseña?", action: {
                                        showForgetPassword = true
                                    }, fontSize: 12, color: .white)
                                }
                                .padding(.trailing, 60)
                            }
                            .padding(.top)
                            
                            ContinueButton(buttonText: "Iniciar sesión", action: {
                                withAnimation {
                                    showLogin = false
                                }
                            }, isDisabled: .constant(false))
                                .padding(.top, 20)
                                                        
                            NormalText(text: "O ingresa con")
                                .padding(.top)
                            
                            GoogleButton(action: {}, buttonText: "Iniciar sesión con Google")
                                .padding(.top)
                            
                            HStack {
                                NormalText(text: "¿Aún no tienes cuenta?")
                                    .padding(.top, 20)
                                
                                UnderlinedButton(text: "Regístrate", action: {
                                    showRegister = true
                                }, fontSize: 20, color: .white)
                                .padding(.top, 20)
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                .padding(.bottom, 20)
            }
            .ignoresSafeArea()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(showLogin: .constant(false))
    }
}
