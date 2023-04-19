//
//  SubheadingView.swift
//  DissertationProject2023
//
//  Created by Louis on 18/04/2023.
//

import SwiftUI

struct SubheadingView: View {
    
    let text: String
    
    var body: some View {
        
        Text(text)
            .font(.system(size: 18, weight: .medium, design: .rounded))
            .multilineTextAlignment(.leading)
            .padding(.top, 5)
        
    }
}

struct SubheadingView_Previews: PreviewProvider {
    static var previews: some View {
        SubheadingView(text: "Test subheading text")
    }
}
