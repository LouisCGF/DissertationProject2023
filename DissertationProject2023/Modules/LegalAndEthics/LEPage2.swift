//
//  LEPage2.swift
//  DissertationProject2023
//
//  Created by Louis on 21/04/2023.
//

import SwiftUI

struct LEPage2: View {
    
    private let legalAndEthicsData = ModelData().legalAndEthicsData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "Understanding the Computer Fraud and Abuse Act (CFAA)", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section2_1)
                
                HeadingTextView(text: "Laws Governing Cybersecurity in Different Countries", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section2_2)
                
                Group {
                    
                    (
                    Text("United Kingdom: ")
                        .fontWeight(.bold)
                    +
                    Text("The Computer Misuse Act 1990")
                    )
                    
                    (
                    Text("Canada: ")
                        .fontWeight(.bold)
                    +
                    Text("The Criminal Code of Canada, specifically Section 342.1")
                    )
                    
                    (
                    Text("Australia: ")
                        .fontWeight(.bold)
                    +
                    Text("The Cybercrime Act 2001")
                    )
                    
                    (
                    Text("European Union: ")
                        .fontWeight(.bold)
                    +
                    Text("The General Data Protection Regulation (GDPR) and the Network and Information Systems (NIS) Directive")
                    )
 
                }
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .multilineTextAlignment(.leading)
                .padding(.top, -5)
                
                HeadingTextView(text: "Penalties for Unauthorized Penetration Testing", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section2_3)
                
                HeadingTextView(text: "Legal Requirements for Performing Penetration Tests", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section2_4)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct LEPage2_Previews: PreviewProvider {
    static var previews: some View {
        LEPage2()
    }
}
