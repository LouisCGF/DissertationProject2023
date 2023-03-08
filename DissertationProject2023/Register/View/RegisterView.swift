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
    
    var body: some View {
        NavigationView {
            VStack {
                Text("We just need a few details from you...")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .opacity(0.5)
                    .padding(.trailing, 100)
                
                Spacer()
                
                // Username Field
                InputTextFieldView(text: $vm.userDetails.userName,
                                   placeholder: "Username",
                                   keyboardType: .namePhonePad,
                                   sfSymbol: "person.crop.circle",
                                   sfSymbolColor: colorScheme == .light ? .black : .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Email Field
                InputTextFieldView(text: $vm.userDetails.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope",
                                   sfSymbolColor: colorScheme == .light ? .black : .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                
                // Password Field
                InputPasswordView(password: $vm.userDetails.password,
                                  viewPassword: viewPassword,
                                  placeholder: "Password",
                                  sfSymbol: "eye.slash",
                                  sfSymbolColor: colorScheme == .light ? .black : .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Confirm Password Field
                InputPasswordView(password: .constant(""),
                                  viewPassword: viewConfPassword,
                                  placeholder: "Confirm Password",
                                  sfSymbol: "eye.slash",
                                  sfSymbolColor: colorScheme == .light ? .black : .white)
                .padding(.horizontal)
                .padding(.top, 10)
                
                ButtonView(title: "Register", background: colorScheme == .light ? .black : .white, foreground: colorScheme == .light ? .white : .black){
                    vm.register()
                    presentationMode.wrappedValue.dismiss()
                    
                }
                .padding()
                
                Spacer()
                
                Divider()
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Register")
            .applyClose()
        }

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
