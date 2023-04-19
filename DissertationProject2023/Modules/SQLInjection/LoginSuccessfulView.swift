//
//  LoginSuccessfulView.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct LoginSuccessfulView: View {
    var body: some View {
        
        VStack {
            
            Text("Login Successful")
                .padding()
            
            Text("Bank Balance: £3000")
                .padding()
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
        )
        
    }
}

struct LoginSuccessfulView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSuccessfulView()
    }
}
