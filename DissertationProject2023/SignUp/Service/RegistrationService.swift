//
//  RegistrationService.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import Combine
import Foundation
import FirebaseDatabase

protocol RegistrationService {
    
    func register(with details: RegistrationDetails)
    
}
