//
//  RegistrationService.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import Combine
import Foundation
import Firebase
import FirebaseDatabase

protocol RegistrationService {
    
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
    
}

final class RegistrationServiceImpl: RegistrationService {
    
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password: details.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            // Create new user
                        }
                    }
            }
            
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
}
