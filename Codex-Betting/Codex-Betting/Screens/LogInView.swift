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
    
    
    @StateObject private var viewModel: LogInViewModel
    
    init(viewModel: LogInViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                NavigationLink(destination: ForgetPasswordView(viewModel: ForgetPasswordViewModel()),
                               tag: LogInViewModel.Router.forgetPassword,
                               selection: $viewModel.router) {
                    EmptyView()
                }.hidden()
                
                NavigationLink(destination: RegisterView(
                    viewModel: RegisterViewModel(
                        repository: UserRepository(
                            auth: AuthManager(),
                            db: UserDatabase(),
                            network: UserNetwork()
                        )
                    )
                ),
                               tag: LogInViewModel.Router.register,
                               selection: $viewModel.router) {
                    EmptyView()
                }.hidden()
                
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
                            
                            
                            CodexTextField(text: $viewModel.textEmail, placeholder: "Ingrese su correo eléctronico", keyboardType: .emailAddress, disableAutocorrection: true, colorScheme: .light, onCommit: {
                                viewModel.verifyEmail()
                            })
                                .frame(width: TEXT_FIELD_WIDTH)
                            
                            if !viewModel.emailError.isEmpty {
                                Text(viewModel.emailError)
                                    .foregroundColor(.red)
                            }
                            
                            NormalText(text: "Contraseña")
                                .padding(.top)
                            
                            VStack {
                                PasswordTextField(text: $viewModel.textPassword, placeholder: "Ingrese su contraseña", colorScheme: .light, onCommit: {
                                    viewModel.verifyPassword()
                                })
                                    .frame(width: TEXT_FIELD_WIDTH)
                                
                                HStack {
                                    Spacer()
                                    
                                    UnderlinedButton(text: "¿Olvidaste tu contraseña?", action: {
                                        viewModel.didTapOnForgetPasswordButton()
                                    }, fontSize: 12, color: .white)
                                }
                                .padding(.trailing, 60)
                            }
                            
                            if !viewModel.passwordError.isEmpty {
                                Text(viewModel.passwordError)
                                    .foregroundColor(.red)
                            }
                            
                            ContinueButton(buttonText: "Iniciar sesión", action: {
                                withAnimation {
                                    viewModel.didTapOnLogInButton()
                                }
                            }, isDisabled: .constant(false))
                                .padding(.top, 20)
                            
                            NormalText(text: "O ingresa con")
                                .padding(.top)
                            
                            GoogleButton(action: {
                                viewModel.didTapOnLogInWithGoogleButton()
                            }, buttonText: "Iniciar sesión con Google")
                                .padding(.top)
                            
                            HStack {
                                NormalText(text: "¿Aún no tienes cuenta?")
                                    .padding(.top, 20)
                                
                                UnderlinedButton(text: "Regístrate", action: {
                                    viewModel.didTapOnRegisterButton()
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
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Aceptar")))
        })
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(viewModel: LogInViewModel(repository: UserRepository(auth: AuthManager(), db: UserDatabase(), network: UserNetwork())))
    }
}
