//
//  Page4.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct Page4: View {
    
    private let sqlInjectionData = ModelData().sqlInjectionData[0]
    
    var body: some View {
        
        ScrollView (.vertical) {
            VStack (alignment: .leading){
                
                Group {
                    HeadingTextView(text: "Preventing SQL Injections", colour: Color(.systemIndigo))
                    
                    SubheadingView(text: sqlInjectionData.section5_1)
                    
                    SubheadingView(text: sqlInjectionData.section5_2)
                    
                    SubheadingView(text: sqlInjectionData.section5_3)
                        .padding()
                    
                    PHPTextView()
                        .cornerRadius(10)
                        .padding()
                    
                    SubheadingView(text: sqlInjectionData.section5_4)
                        .padding()
                    
                    SubheadingView(text: sqlInjectionData.section5_5)
                    
                    SubheadingView(text: sqlInjectionData.section5_6)
                        .padding()
                    
                    SubheadingView(text: sqlInjectionData.section5_7)
                    
                    SubheadingView(text: sqlInjectionData.section5_8)
                        .padding()
                    
                }
                
                HeadingTextView(text: "Conclusion", colour: Color(.systemIndigo))
                
                SubheadingView(text: sqlInjectionData.conclusion)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct Page4_Previews: PreviewProvider {
    static var previews: some View {
        Page4()
    }
}
