//
//  NRPage1.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct NRPage1: View {
    
    private let networkReconData = ModelData().networkReconData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "Introduction", colour: Color(.systemPink))
                
                SubheadingView(text: networkReconData.intro)
                
                HeadingTextView(text: "What is Network Reconnaissance?", colour: Color(.systemPink))
                
                SubheadingView(text: networkReconData.section1_1)
                
                SubheadingView(text: "1. Passive Recon:")
                    .fontWeight(.bold)
                
                SubheadingView(text: networkReconData.section1_2)
                    .padding()
                
                SubheadingView(text: "2. Active Recon:")
                    .fontWeight(.bold)
                
                SubheadingView(text: networkReconData.section1_3)
                    .padding()
                
                SubheadingView(text: networkReconData.section1_4)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct NRPage1_Previews: PreviewProvider {
    static var previews: some View {
        NRPage1()
    }
}
