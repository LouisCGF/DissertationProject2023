//
//  LEPage3.swift
//  DissertationProject2023
//
//  Created by Louis on 22/04/2023.
//

import SwiftUI

struct LEPage3: View {
    
    private let legalAndEthicsData = ModelData().legalAndEthicsData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "The Importance of Ethics in Penetration Testing", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section3_1)
                
                HeadingTextView(text: "The Penetration Testing Execution Standard (PTES)", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section3_2)
                
                HeadingTextView(text: "The OWASP Code of Ethics", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section3_3)
                
                HeadingTextView(text: "Handling Sensitive Data and Vulnerability Disclosure", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section3_4)
                
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct LEPage3_Previews: PreviewProvider {
    static var previews: some View {
        LEPage3()
    }
}
