//
//  PCPage1.swift
//  DissertationProject2023
//
//  Created by Louis on 20/04/2023.
//

import SwiftUI

struct PCPage1: View {
    
    private let passwordCrackingData = ModelData().passwordCrackingData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                Group {
                    HeadingTextView(text: "Introduction", colour: Color(.systemTeal))
                    
                    SubheadingView(text: passwordCrackingData.intro)
                    
                    Subheading2View(text: passwordCrackingData.introNote)
                    
                    HeadingTextView(text: "Understanding Password Cracking", colour: Color(.systemTeal))
                    
                    SubheadingView(text: passwordCrackingData.section1_1)
                    
                    SubheadingView(text: "1. Brute Force")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: passwordCrackingData.section1_2)
                        .padding()
                    
                    SubheadingView(text: "2. Dictionary Attacks")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: passwordCrackingData.section1_3)
                        .padding()
                    
                }
                
                SubheadingView(text: "3. Rainbow Tables")
                    .fontWeight(.bold)

                SubheadingView(text: passwordCrackingData.section1_4)
                    .padding()
                
                SubheadingView(text: "4. Hybrid Attacks")
                    .fontWeight(.bold)
                
                SubheadingView(text: passwordCrackingData.section1_5)
                    .padding()
                
                SubheadingView(text: passwordCrackingData.section1_6)
                
                SubheadingView(text: passwordCrackingData.section1_7)
                
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct PCPage1_Previews: PreviewProvider {
    static var previews: some View {
        PCPage1()
    }
}
