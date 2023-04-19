//
//  Subheading2View.swift
//  DissertationProject2023
//
//  Created by Louis on 18/04/2023.
//

import SwiftUI

struct Subheading2View: View {
    
    let text: String
    
    var body: some View {
        
        Text(text)
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .multilineTextAlignment(.leading)
            .padding(.top, 5)
        
    }
}

struct Subheading2View_Previews: PreviewProvider {
    static var previews: some View {
        Subheading2View(text: "Test subheading2 view")
    }
}
