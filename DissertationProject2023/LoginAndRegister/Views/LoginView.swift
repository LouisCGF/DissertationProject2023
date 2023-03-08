//
//  LoginView.swift
//  DissertationProject2023
//
//  Created by Louis on 08/03/2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    
    @StateObject private var vm = LoginViewModelImpl(
        service: LoginServiceImpl()
    )
    @EnvironmentObject var googleVm: GoogleSignInViewModel
    
    @Environment(\.colorScheme) var colorScheme
    @State var viewPassword = false
    @State private var showForgotPassword = false
    @State private var showRegister = false
    
    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 5)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("loginBackgroundColor"), Color("loginBackgroundColor2")]), startPoint: .leading, endPoint: .trailing)
                )
                .ignoresSafeArea()

            VStack () {
                
                Spacer()
                
                VStack (alignment: .leading, spacing: 5){
                    
                    Image(systemName: "lock.shield")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                    
                    Text("Let's sign you in...")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("Welcome back")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .opacity(0.5)
                }
                .padding([.bottom, .trailing], 50)
                
                
                // Email Field
                InputTextFieldView(text: $vm.credentials.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope",
                                   sfSymbolColor: .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Password Field
                InputPasswordView(password: $vm.credentials.password,
                                  viewPassword: viewPassword,
                                  placeholder: "Password",
                                  sfSymbol: "eye.slash",
                                  sfSymbolColor: .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Forgot Password
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        showForgotPassword.toggle()
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                            .font(.subheadline)
                    }
                    .sheet(isPresented: $showForgotPassword,
                           content: {
                        ForgotPasswordView()
                    })
                    
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer()

                VStack {
                    
                    HStack (spacing: 5){
                        Text("Don't have an account?")
                            .opacity(0.5)
                        
                        Button {
                            showRegister.toggle()
                        } label: {
                            Text("Register")
                                .fontWeight(.bold)
                        }
                        .sheet(isPresented: $showRegister,
                               content: {
                            RegisterView()
                        })

                    }
                    .foregroundColor(.white)
                    .font(.footnote)
                    
                    ButtonView(title: "Sign In"){
                        vm.login()
                    }
                }
                
                HStack (spacing: 15) {
                    
                    Rectangle()
                        .fill(.white)
                        .frame(height: 1)
                        .opacity(0.5)
                    
                    Text("or")
                        .foregroundColor(.white)
                        .font(.footnote)
                    
                    Rectangle()
                        .fill(.white)
                        .frame(height: 1)
                        .opacity(0.5)
                    
                }
                .padding(.horizontal, 30)
                .padding([.bottom, .top], 10)
                
                // Sign in with Google Button
                GoogleSignInButton (viewModel: GoogleSignInButtonViewModel(scheme: .light, style: .wide, state: .normal)) {
                    googleVm.googleSignIn()
                }
                .cornerRadius(7)
                
                
            }
           .padding()
        
        }
        .alert(isPresented: $vm.hasError,
               content: {
            
            if case .failed(let error) = vm.state {
                return Alert(
                    title: Text("Error"),
                    message: Text(error.localizedDescription))
            } else {
                return Alert(
                    title: Text("Error"),
                    message: Text("Something went wrong"))
            }
            
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
