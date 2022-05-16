//
//  RegisterView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 15/04/22.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel: RegisterViewModel
    @State private var goToTerms: Bool = false
    
    private let TEXT_FIELD_WIDTH = UIScreen.main.bounds.width - 120
    
    init(viewModel: RegisterViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            NavigationLink(
                isActive: $goToTerms) {
                    LegalView()
                } label: {
                    EmptyView()
                }
            
            CodexToolBar()
                .padding(.horizontal)
            
            Text("Crear cuenta")
                .foregroundColor(.white)
                .font(
                    Font.custom(
                        HKGrotesk.bold.rawValue,
                        size: 32
                    )
                )
            
            VStack(alignment: .leading) {
                NormalText(text: "Correo eléctronico")
                
                
                CodexTextField(text: $viewModel.emailText, placeholder: "Ingrese su correo eléctronico", keyboardType: .emailAddress, disableAutocorrection: true, colorScheme: .light,
                               onCommit: {
                    viewModel.verifyEmail()
                })
                    .frame(width: TEXT_FIELD_WIDTH)
                
                if !viewModel.emailError.isEmpty {
                    Text(viewModel.emailError)
                        .foregroundColor(.red)
                        .padding(.bottom, 5)
                }
                
                NormalText(text: "Contraseña")
                
                PasswordTextField(text: $viewModel.passwordText, placeholder: "Ingrese su contraseña", colorScheme: .light, onCommit: {
                    viewModel.verifyPassword()
                })
                    .frame(width: TEXT_FIELD_WIDTH)
                
                if !viewModel.passwordError.isEmpty {
                    Text(viewModel.passwordError)
                        .foregroundColor(.red)
                        .padding(.bottom, 5)
                }
                
                NormalText(text: "Confirmar contraseña")
                
                PasswordTextField(text: $viewModel.passwordConfirmationText, placeholder: "Confirme su contraseña", colorScheme: .light, onCommit: {
                    viewModel.verifyPasswordMatch()
                })
                    .frame(width: TEXT_FIELD_WIDTH)
                
                if !viewModel.passwordConfirmationError.isEmpty {
                    Text(viewModel.passwordConfirmationError)
                        .foregroundColor(.red)
                        .padding(.bottom, 5)
                }
                
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 0) {
                    Checkbox(isSelected: $viewModel.hasAcceptedTerms, squareSize: 25, checkmarkSize: 15)
                        .padding(.trailing, 5)
                    
                    NormalText(text: "Aceptar ")
                    
                    UnderlinedButton(text: " Política de privacidad y T&C", action: {
                        self.goToTerms = true
                    }, fontSize: 20, color: .codexGolden)
                    
                    Spacer()
                }
                .padding(.top)
                
                if !viewModel.termsError.isEmpty {
                    Text(viewModel.termsError)
                        .foregroundColor(.red)
                }
            }
            .padding(.leading, 60)
            .padding(.top)
            
            ContinueButton(buttonText: "Crear cuenta", action: {
                viewModel.didTapOnCreateAccountButton()
            }, isDisabled: .constant(false))
                .padding(.top)
            
            NormalText(text: "O registrate con:")
                .padding(.top, 20)
            
            GoogleButton(action: {
                viewModel.didTapOnRegisterWithGoogle()
            }, buttonText: "Registrarse con Google")
                .padding(.top)
            
            HStack {
                NormalText(text: "¿Ya tienes cuenta?")
                    .padding(.top, 20)
                
                UnderlinedButton(text: "Iniciar sesión", action: {
                    presentationMode.wrappedValue.dismiss()
                }, fontSize: 20, color: .white)
                    .padding(.top, 20)
            }
            
            
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("Aceptar")))
        })
        .background(Color.codexBlack)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: RegisterViewModel(repository: UserRepository(auth: AuthManager(), db: UserDatabase(), network: UserNetwork())))
    }
}
