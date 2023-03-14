//
//  ModuleViewHandler.swift
//  DissertationProject2023
//
//  Created by Louis on 14/03/2023.
//

import SwiftUI

struct ModuleViewHandler: View {
    
    var module: Module
    
    var body: some View {
        
        switch (module.id){
        case 1001: // <- SQL Injection
            SQLInjectionView()
        case 1002: // <- Network Recon
            NetworkReconView()
        case 1003: // <- XSS
            XSSView()
        case 1004: // <- Password Cracking
            PasswordCrackingView()
        case 1005: // <- OSINT
            OSINTView()
        case 1006: // <- Legal and Ethics
            LegalAndEthicsView()
            
        default:
            ModuleViewHandler(module: module)
        }
        
    }
}

struct ModuleViewHandler_Previews: PreviewProvider {
    static var previews: some View {
        ModuleViewHandler(module: ModelData().modules[0])
    }
}
