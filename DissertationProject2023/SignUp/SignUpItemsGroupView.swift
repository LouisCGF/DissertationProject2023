//
//  SignUpItemsGroupView.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct SignUpItemsGroupView: View {
    var body: some View {
        HStack (alignment: .center, spacing: -30) {
            
            // Google
            Button {
                
            } label: {
                SignUpItemView(image: "btn_google_light_normal_ios")
            }
            
            // Microsoft
            Button {
                
            } label: {
                SignUpItemView(image: "ms-symbollockup_mssymbol_19")
            }
            
        }
    }
}

struct SignUpItemsGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpItemsGroupView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
