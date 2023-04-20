//
//  PCPage2.swift
//  DissertationProject2023
//
//  Created by Louis on 20/04/2023.
//

import SwiftUI

struct PCPage2: View {
    
    private let passwordCrackingData = ModelData().passwordCrackingData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                Group {
                    HeadingTextView(text: "Introduction to Hashcat", colour: Color(.systemTeal))
                    
                    SubheadingView(text: passwordCrackingData.section2_1)
                    
                    SubheadingView(text: "1. Multiple Attack Modes")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: passwordCrackingData.section2_2)
                        .padding()
                    
                    SubheadingView(text: "2. Extensive Algorithm Support")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: passwordCrackingData.section2_3)
                        .padding()
                    
                    SubheadingView(text: "3. GPU Acceleration")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: passwordCrackingData.section2_4)
                        .padding()
                    
                    SubheadingView(text: "4. Multi-platform Support")
                        .fontWeight(.bold)
                    
                    SubheadingView(text: passwordCrackingData.section2_5)
                        .padding()
                }
                
                SubheadingView(text: "5. Customization and Extensibility")
                    .fontWeight(.bold)
                
                SubheadingView(text: passwordCrackingData.section2_6)
                    .padding()
                
                SubheadingView(text: passwordCrackingData.section2_7)
                
                SubheadingView(text: passwordCrackingData.section2_8)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
    }
}

struct PCPage2_Previews: PreviewProvider {
    static var previews: some View {
        PCPage2()
    }
}
