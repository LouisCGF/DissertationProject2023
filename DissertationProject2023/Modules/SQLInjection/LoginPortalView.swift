//
//  LoginPortalView.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct LoginPortalView: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            InputTextFieldView(text: $email, placeholder: "Email", keyboardType: .asciiCapable, sfSymbol: "envelope", sfSymbolColor: .black)
            
            InputPasswordView(password: $password, viewPassword: false, placeholder: "Password", sfSymbol: "lock", sfSymbolColor: .black)
            
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
        
        
    }
}

struct LoginPortalView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPortalView(email: .constant(""), password: .constant(""))
    }
}
