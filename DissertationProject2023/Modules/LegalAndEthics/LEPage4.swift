//
//  LEPage4.swift
//  DissertationProject2023
//
//  Created by Louis on 22/04/2023.
//

import SwiftUI

struct LEPage4: View {
    
    private let legalAndEthicsData = ModelData().legalAndEthicsData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "Scoping and Defining the Penetration Test", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section4_1)
                
                HeadingTextView(text: "Obtaining Written Consent from Clients", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section4_2)
                
                SubheadingView(text: legalAndEthicsData.section4_3)
                    .fontWeight(.bold)
                    .padding()
                
                HeadingTextView(text: "Identifying Legal and Ethical Boundaries in a Test", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section4_4)
                
                SubheadingView(text: legalAndEthicsData.section4_5)
                    .padding()
                
                HeadingTextView(text: "Penetration Testing Contracts: Roles, Responsibilities, and Expectations", colour: Color(.systemYellow))
                
                Group {
                    
                    SubheadingView(text: legalAndEthicsData.section4_6)
                    
                    SubheadingView(text: legalAndEthicsData.section4_7)
                        .fontWeight(.bold)
                        .padding()
                    
                    SubheadingView(text: legalAndEthicsData.section4_8)
                }
                
       
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct LEPage4_Previews: PreviewProvider {
    static var previews: some View {
        LEPage4()
    }
}
