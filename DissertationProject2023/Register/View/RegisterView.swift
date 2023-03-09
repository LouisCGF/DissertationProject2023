//
//  RegisterView.swift
//  DissertationProject2023
//
//  Created by Louis on 08/03/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var vm = RegistrationViewModelImpl(
        service: RegistrationServiceImpl()
    )
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @State var viewPassword = false
    @State var viewConfPassword = false
    
    @State var userNameHasError = false
    @State var emailHasError = false
    @State var passwordHasError = false
    @State var confPasswordHasError = false
    
    @State var confPassword = ""
    
    @State var showPasswordPolicy = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                Text("We just need a few details from you...")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .opacity(0.5)
                    .padding(.trailing, 100)
                
                Spacer()
                
                // Username Field
                Group {
                    InputTextFieldView(text: $vm.userDetails.userName,
                                       placeholder: "Username",
                                       keyboardType: .namePhonePad,
                                       sfSymbol: "person.crop.circle",
                                       sfSymbolColor: colorScheme == .light ? .black : .white)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .onChange(of: vm.userDetails.userName) { newValue in
                        userNameHasError = !validateUserName()
                    }
                    .background()
                    
                    if userNameHasError {
                        Text("Username must be at least 3 characters")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.red)
                            .padding(.leading, 20)
                    }
                }

                
                // Email Field
                Group {
                    InputTextFieldView(text: $vm.userDetails.email,
                                       placeholder: "Email",
                                       keyboardType: .emailAddress,
                                       sfSymbol: "envelope",
                                       sfSymbolColor: colorScheme == .light ? .black : .white)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .onChange(of: vm.userDetails.email) { newValue in
                        emailHasError = !validateEmail()
                    }
                    
                    if emailHasError {
                        Text("Please enter a valid email")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.red)
                            .padding(.leading, 20)
                    }
                }

                
                // Password Field
                Group {
                    InputPasswordView(password: $vm.userDetails.password,
                                      viewPassword: viewPassword,
                                      placeholder: "Password",
                                      sfSymbol: "eye.slash",
                                      sfSymbolColor: colorScheme == .light ? .black : .white)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .onChange(of: vm.userDetails.password) { newValue in
                        passwordHasError = !validatePassword()
                    }
                    
                    if passwordHasError {
                        HStack (spacing: 2) {
                            Text("Password must fit ")
                                .fontWeight(.semibold)
                            
                            Button {
                                showPasswordPolicy = true
                            } label: {
                                Text("password policy")
                                    .fontWeight(.bold)
                            }
                            .alert(isPresented: $showPasswordPolicy){
                                Alert(title: Text("Password Policy"), message: Text("Must contain at least:\n1 uppercase character\n1 lowercase character\n1 number\n1 special character\nMust be at least 8 characters long"), dismissButton: .default(Text("Got it")))
                            }
                        }
                        .font(.system(size: 12))
                        .foregroundColor(.red)
                        .padding(.leading, 20)
                        
                    }
                }
                

                // Confirm Password Field
                Group {
                    InputPasswordView(password: $confPassword,
                                      viewPassword: viewConfPassword,
                                      placeholder: "Confirm Password",
                                      sfSymbol: "eye.slash",
                                      sfSymbolColor: colorScheme == .light ? .black : .white)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .onChange(of: confPassword) { newValue in
                        confPasswordHasError = !validateConfPassword()
                    }
                    
                    if confPasswordHasError {
                        Text("Passwords must match")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.red)
                            .padding(.leading, 20)
                    }
                }

                
                ButtonView(title: "Register", background: colorScheme == .light ? .black : .white, foreground: colorScheme == .light ? .white : .black){
                    vm.register()
                    presentationMode.wrappedValue.dismiss()
                    
                }
                .padding()
                .disabled(!validateAll())
                .opacity(validateAll() ? 1 : 0.5)
                
                Divider()
                    .overlay(colorScheme == .light ? .black : .white)
                    .padding([.top, .bottom], 10)
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Register")
            .applyClose()
        }
    }
    
    // For each of these functions: returns true if valid and false if not
    private func validateUserName() -> Bool {
        return vm.userDetails.userName.count >= 3
    }
    
    private func validateEmail() -> Bool {
        let emailRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // <- Email format regex
        let emailCheck = NSPredicate(format:"SELF MATCHES %@", emailRegx)
        return emailCheck.evaluate(with: vm.userDetails.email)
    }
    
    private func validatePassword() -> Bool {
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$" // <- Password format regex
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: vm.userDetails.password) && !vm.userDetails.password.isEmpty
    }
    
    private func validateConfPassword() -> Bool {
        return vm.userDetails.password == confPassword
    }
    
    private func validateAll() -> Bool {
        return validateUserName() && validateEmail() && validatePassword() && validateConfPassword()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
