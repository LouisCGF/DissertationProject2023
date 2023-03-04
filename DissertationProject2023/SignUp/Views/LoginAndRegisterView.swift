//
//  GetStartedView.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct LoginAndRegisterView: View {
    
    @State var index = 0
    @State var viewPassword = false
    @State var viewConfPassword = false
    
    var body: some View {
        GeometryReader {_ in
            
            VStack  {
                
                
                ZStack {
                    
                    Register(index: self.$index, viewPassword: self.$viewPassword, viewConfPassword: self.$viewConfPassword)
                        // Changing view order
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index, viewPassword: self.$viewPassword)
                    
                }
                
                HStack (spacing: 15) {
                    
                    Rectangle()
                        .fill(.black)
                        .frame(height: 1)
                    
                    Text("Or")
                        .foregroundColor(.black)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(height: 1)
                    
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                SocialIconsGroupView()
                    .padding(.vertical)
                
            }

        }
        
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginAndRegisterView()
        }
    }
}

// Right Curve
struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
            // Right side curve
            path.move(to: CGPoint( x: rect.width, y: 100 ))
            path.addLine(to: CGPoint( x: rect.width, y: rect.height ))
            path.addLine(to: CGPoint( x: 0, y: rect.height ))
            path.addLine(to: CGPoint( x: 0, y: 0 ))
            
        }
        
    }
    
}

// Left Curve
struct CShape1 : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
            // Left side curve
            path.move(to: CGPoint( x: 0, y: 100 ))
            path.addLine(to: CGPoint( x: 0, y: rect.height ))
            path.addLine(to: CGPoint( x: rect.width, y: rect.height ))
            path.addLine(to: CGPoint( x: rect.width, y: 0 ))
            
        }
        
    }
    
}

struct Login: View {
    
    @State var email = ""
    @State var pass = ""
    @State private var showForgotPassword = false
    @Binding var index : Int
    @Binding var viewPassword: Bool
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            VStack {

                HStack {
                    
                    VStack (spacing: 10) {
                        Text("Login")
                            .foregroundColor( self.index == 0 ? .white : .gray )
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill( self.index == 0 ? .green : .clear )
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.top, 30)
                
                // Email Field
                InputTextFieldView(text: .constant(""),
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope",
                                   sfSymbolColor: .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                
                // Password Field
                InputPasswordView(password: .constant(""),
                                  placeholder: "Password",
                                  sfSymbol: "eye.slash")
                .padding(.horizontal)
                .padding(.top, 10)
                
                // This is to match the height of the signup view - probably a dumb way of doing it but whatever
                InputTextFieldView(text: .constant(""),
                                   placeholder: "",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "",
                                   sfSymbolColor: .clear)
                .padding(.horizontal)
                .padding(.top, 10)
                .opacity(0)
                
                
                // Forgot Password
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        showForgotPassword.toggle()
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                    .sheet(isPresented: $showForgotPassword,
                           content: {
                        ForgotPasswordView()
                    })
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color(hue: 1.0, saturation: 0.014, brightness: 0.418))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                
                self.index = 0
                
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            // Login Button
            ButtonView(title: "Login",
                       background: .gray){
                
            }
            .padding()
            .offset(y: 25)
            .opacity( self.index == 0 ? 1 : 0 )
        }
        
    }
    
}

struct Register : View {
    
    @StateObject private var vm = RegistrationViewModelImpl(
        service: RegistrationServiceImpl()
    )
    

    @Binding var index : Int
    @Binding var viewPassword: Bool
    @Binding var viewConfPassword: Bool
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            VStack {

                HStack {
                    
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 10) {
                        Text("Register")
                            .foregroundColor( self.index == 1 ? .white : .gray )
                            .font(.title)
                        .fontWeight(.bold)
                        
                        Capsule()
                            .fill( self.index == 1 ? .green : .clear )
                            .frame(width: 100, height: 5)
                        
                    }
                    
                }
                .padding(.top, 30)
                
                // Username Field
                InputTextFieldView(text: $vm.userDetails.userName,
                                   placeholder: "Username",
                                   keyboardType: .namePhonePad,
                                   sfSymbol: "person.crop.circle",
                                   sfSymbolColor: .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Email Field
                InputTextFieldView(text: $vm.userDetails.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope",
                                   sfSymbolColor: .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                
                // Password Field
                InputPasswordView(password: $vm.userDetails.password,
                                  placeholder: "Password",
                                  sfSymbol: "eye.slash")
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Confirm Password Field
                InputPasswordView(password: .constant(""),
                                  placeholder: "Confirm Password",
                                  sfSymbol: "eye.slash")
                .padding(.horizontal)
                .padding(.top, 10)
                

                
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color(hue: 1.0, saturation: 0.014, brightness: 0.418))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                
                self.index = 1
                
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            // Sign up Button
            ButtonView(title: "Sign Up",
                       background: .gray){
                vm.register()
            }
            .padding()
            .offset(y: 25)
            .opacity( self.index == 1 ? 1 : 0 )
        }
        
    }
    
}
