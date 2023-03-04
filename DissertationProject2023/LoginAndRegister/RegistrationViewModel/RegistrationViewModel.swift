//
//  RegistrationViewModel.swift
//  DissertationProject2023
//
//  Created by Louis on 04/03/2023.
//

import Foundation
import Combine

enum RegistrationState {
    case successfull
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func register()
    var hasError: Bool { get }
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationDetails { get }
    init(service: RegistrationService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {

    let service: RegistrationService
    
    @Published var hasError: Bool = false
    @Published var state: RegistrationState = .na
    @Published var userDetails: RegistrationDetails = RegistrationDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscriptions()
    }
    
    func register() {
        
        service
            .register(with: userDetails)
            .sink { [weak self] res in
                
                switch res {
                case .failure (let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)
        
    }
    
}

private extension RegistrationViewModelImpl {
    
    func setupErrorSubscriptions() {
        
        $state
            .map { state -> Bool in
                
                switch state{
                case .successfull,
                        .na:
                    return false
                case .failed:
                    return true
                }
                
            }
            .assign(to: &$hasError)
        
    }
    
}
