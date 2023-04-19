//
//  HeadingTextView.swift
//  DissertationProject2023
//
//  Created by Louis on 18/04/2023.
//

import SwiftUI

struct HeadingTextView: View {
    
    let text: String
    let colour: Color
    
    var body: some View {
        
        Text(text)
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .foregroundColor(colour)
            .multilineTextAlignment(.center)
            .padding(.top, 50)
        
    }
}

struct HeadingTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingTextView(text: "Test Heading Text", colour: Color(.systemIndigo))
    }
}
