//
//  GetStartedView.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct LoginAndSignupView: View {
    
    @State var index = 0
    @State var viewPassword = false
    @State var viewConfPassword = false
    
    var body: some View {
        GeometryReader {_ in
            
            VStack  {
                
                
                ZStack {
                    
                    SignUp(index: self.$index, viewPassword: self.$viewPassword, viewConfPassword: self.$viewConfPassword)
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
        LoginAndSignupView()
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

struct Login : View {
    
    @State var email = ""
    @State var pass = ""
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
                            .fill( self.index == 0 ? .blue : .clear )
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.top, 30)
                
                // Email Field
                VStack {
                    
                    HStack (spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white)
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.white)
                            
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                
                // Password Field
                VStack {
                    
                    HStack (spacing: 15) {
                        Image(systemName: self.viewPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                self.viewPassword.toggle()
                            }
                        
                        Group {
                            if !self.viewPassword {
                                SecureField("Password", text: self.$pass)
                                    .foregroundColor(.white)
                            } else {
                                TextField("Password", text: self.$pass)
                                    .foregroundColor(.white)
                            }
                        }
                     
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                
                // Forgot Password
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                    
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
            Button {
                
            } label: {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.19))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity( self.index == 0 ? 1 : 0 )
        }
        
    }
    
}

struct SignUp : View {
    
    @State var email = ""
    @State var pass = ""
    @State var confPass = ""
    @Binding var index : Int
    @Binding var viewPassword: Bool
    @Binding var viewConfPassword: Bool
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            VStack {

                HStack {
                    
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 10) {
                        Text("Sign Up")
                            .foregroundColor( self.index == 1 ? .white : .gray )
                            .font(.title)
                        .fontWeight(.bold)
                        
                        Capsule()
                            .fill( self.index == 1 ? .blue : .clear )
                            .frame(width: 100, height: 5)
                        
                    }
                    
                }
                .padding(.top, 30)
                
                // Email Field
                VStack {
                    
                    HStack (spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white)
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.white)
                            
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                
                // Password Field
                VStack {
                    
                    HStack (spacing: 15) {
                        Image(systemName: self.viewPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                self.viewPassword.toggle()
                            }
                        
                        Group {
                            if !self.viewPassword {
                                SecureField("Password", text: self.$pass)
                                    .foregroundColor(.white)
                            } else {
                                TextField("Password", text: self.$pass)
                                    .foregroundColor(.white)
                            }
                        }
                            
                        
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // Confirm Password Field
                VStack {
                    
                    HStack (spacing: 15) {
                        Image(systemName: self.viewConfPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                self.viewConfPassword.toggle()
                            }
                        
                        Group {
                            if !self.viewConfPassword {
                                SecureField("Confirm Password", text: self.$confPass)
                                    .foregroundColor(.white)
                            } else {
                                TextField("Confirm Password", text: self.$confPass)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                }
                .padding(.horizontal)
                .padding(.top, 30)
                

                
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
            
            // Login Button
            Button {
                
            } label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.19))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity( self.index == 1 ? 1 : 0 )
        }
        
    }
    
}
