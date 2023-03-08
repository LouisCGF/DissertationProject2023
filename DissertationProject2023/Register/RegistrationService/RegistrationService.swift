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

enum RegistrationKeys: String {
    case userName
    case email
}

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
                            if let uid = res?.user.uid {
                                
                                let values = [RegistrationKeys.userName.rawValue: details.userName,
                                              RegistrationKeys.email.rawValue: details.email] as [String : Any]
                                
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                        
                                    }
                                
                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                        }
                    }
            }
            
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
        
    }
}
