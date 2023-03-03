//
//  SignUpItemsGroupView.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct SocialIconsGroupView: View {
    var body: some View {
        HStack (alignment: .center, spacing: -5) {
            
            // Google
            Button {
                
            } label: {
                
                SocialIconView(image: "btn_google_light_normal_ios")
                
            }
            
            // Microsoft
            Button {
                
            } label: {
                SocialIconView(image: "ms-symbollockup_mssymbol_19")
            }
            
            // Facebook
            Button {
                
            } label: {
                SocialIconView(image: "icons8-facebook")
            }
            
        }
    }
}

struct SignUpItemsGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SocialIconsGroupView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
