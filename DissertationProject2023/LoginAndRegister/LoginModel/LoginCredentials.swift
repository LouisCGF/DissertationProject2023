//
//  LoginCredentials.swift
//  DissertationProject2023
//
//  Created by Louis on 04/03/2023.
//

import Foundation

struct LoginCredentials {
    var email: String
    var password: String
}

extension LoginCredentials {
    
    static var new: LoginCredentials {
        LoginCredentials(email: "",
                         password: "")
    }
    
}
