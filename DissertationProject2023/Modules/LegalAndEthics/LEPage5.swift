//
//  LEPage5.swift
//  DissertationProject2023
//
//  Created by Louis on 22/04/2023.
//

import SwiftUI

struct LEPage5: View {
    
    private let legalAndEthicsData = ModelData().legalAndEthicsData[0]
    
    var body: some View {
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "The Importance of Reporting in Penetration Testing", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section5_1)
                
                HeadingTextView(text: "Components of a Comprehensive Penetration Testing Report", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section5_2)
                
                HeadingTextView(text: "Confidentiality and Non-Disclosure Agreements", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section5_3)
                
                HeadingTextView(text: "Post-Test Review and Remediation", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section5_4)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
    }
}

struct LEPage5_Previews: PreviewProvider {
    static var previews: some View {
        LEPage5()
    }
}
