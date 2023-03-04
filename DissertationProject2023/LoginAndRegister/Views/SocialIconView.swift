//
//  SignUpItemView.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct SocialIconView: View {
    
    let image: String
    
    var body: some View {
        ZStack {
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                
            
        }
        .frame(width: 85, height: 60, alignment: .center)
        
    }
}

struct SignUpItemView_Previews: PreviewProvider {
    static var previews: some View {
        SocialIconView(image: "btn_google_light_normal_ios")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
