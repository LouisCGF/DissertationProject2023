//
//  SignUpItemView.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct SignUpItemView: View {
    
    let image: String
    
    var body: some View {
        ZStack {
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 40, alignment: .center)
                .cornerRadius(10)
            
        }
        .frame(width: 85, height: 60, alignment: .center)
        
    }
}

struct SignUpItemView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpItemView(image: "btn_google_light_normal_ios")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
