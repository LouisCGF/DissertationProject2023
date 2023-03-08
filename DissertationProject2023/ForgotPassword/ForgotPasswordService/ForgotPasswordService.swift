//
//  ForgotPasswordService.swift
//  DissertationProject2023
//
//  Created by Louis on 04/03/2023.
//

import Foundation
import Combine
import FirebaseAuth

protocol ForgotPasswordService {
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error>
}

final class ForgotPasswordServiceImpl: ForgotPasswordService {
    
    func sendPasswordReset(to email: String) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth
                    .auth()
                    .sendPasswordReset(withEmail: email) { error in
                        
                        if let err = error{
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                        
                    }
            }
        }
        .eraseToAnyPublisher()
        
    }
}
