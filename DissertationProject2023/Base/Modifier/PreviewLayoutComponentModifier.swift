//
//  PreviewLayoutComponentModifier.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import SwiftUI

struct PreviewLayoutComponentModifier: ViewModifier {
    
    let name: String
    
    func body(content: Content) -> some View {
        
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
            .padding()
        
    }
    
}

extension View {
    
    func preview(with name: String) -> some View {
        self.modifier(PreviewLayoutComponentModifier(name: name))
    }
    
}
