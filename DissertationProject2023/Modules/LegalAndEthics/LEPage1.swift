//
//  LEPage1.swift
//  DissertationProject2023
//
//  Created by Louis on 21/04/2023.
//

import SwiftUI

struct LEPage1: View {
    
    private let legalAndEthicsData = ModelData().legalAndEthicsData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "Introduction", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.intro)
                
                HeadingTextView(text: "What is Penetration Testing?", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section1_1)
                
                HeadingTextView(text: "Types of Penetration Testing", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section1_2)
                
                Group {

                    Group {
                        
                        SubheadingView(text: "\n1. Black Box Testing:")
                            .fontWeight(.bold)
                        
                        SubheadingView(text: legalAndEthicsData.section1_2_1)
                            .padding()
                        
                        SubheadingView(text: "\n2. White Box Testing:")
                            .fontWeight(.bold)
                        
                        SubheadingView(text: legalAndEthicsData.section1_3)
                            .padding()
                        
                        SubheadingView(text: "\n3. Grey Box Testing")
                            .fontWeight(.bold)
                        
                        SubheadingView(text: legalAndEthicsData.section1_4)
                            .padding()
                        
                        SubheadingView(text: "\n4. External Penetration Testing")
                            .fontWeight(.bold)
                        
                        SubheadingView(text: legalAndEthicsData.section1_5)
                            .padding()
                        
                        SubheadingView(text: "\n5. Internal Penetration Testing")
                            .fontWeight(.bold)
                        
                        SubheadingView(text: legalAndEthicsData.section1_6)
                            .padding()
                    }

                    
                    SubheadingView(text: "\n6. Social Engineering")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: legalAndEthicsData.section1_7)
                        .padding()
                    
                }
                
                HeadingTextView(text: "The role of Penetration Testing in Cybersecurity", colour: Color(.systemYellow))
                
                SubheadingView(text: legalAndEthicsData.section1_8)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct LEPage1_Previews: PreviewProvider {
    static var previews: some View {
        LEPage1()
    }
}
