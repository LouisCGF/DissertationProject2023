//
//  ForgotPasswordView.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var vm = ForgotPasswordViewModelImpl(
        service: ForgotPasswordServiceImpl()
    )
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading, spacing: 16) {
                
                Text("Enter the email associated with your account and we'll send a password reset email if an account exists")
                    .padding()
                
                Spacer()
                
                InputTextFieldView(text: $vm.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope",
                                   sfSymbolColor: .gray)
                
                ButtonView(title: "Send Password Reset", background: colorScheme == .light ? .black : .white, foreground: colorScheme == .light ? .white : .black){
                    vm.sendPasswordReset()
                    presentationMode.wrappedValue.dismiss()
                }
                
                Spacer()
            }
            .padding(.horizontal, 15)
            .navigationTitle("Reset Password")
            .applyClose()
            
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
