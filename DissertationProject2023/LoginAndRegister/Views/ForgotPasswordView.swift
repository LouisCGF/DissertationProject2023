//
//  ForgotPasswordView.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = ForgotPasswordViewModelImpl(
        service: ForgotPasswordServiceImpl()
    )
    
    var body: some View {
        
        NavigationView {
            
            VStack (spacing: 16) {
                
                InputTextFieldView(text: $vm.email,
                                   placeholder: "Email",
                                   keyboardType: .emailAddress,
                                   sfSymbol: "envelope",
                                   sfSymbolColor: .gray)
                
                ButtonView(title: "Send Password Reset"){
                    vm.sendPasswordReset()
                    presentationMode.wrappedValue.dismiss()
                }
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
