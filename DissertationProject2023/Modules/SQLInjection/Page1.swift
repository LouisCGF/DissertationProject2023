//
//  Page1.swift
//  DissertationProject2023
//
//  Created by Louis on 14/03/2023.
//

import SwiftUI

struct Page1: View {
    
    private let sqlInjectionData = ModelData().sqlInjectionData[0]
    
    var body: some View {
        ScrollView (.vertical){
   
            VStack (alignment: .leading){
                
                HeadingTextView(text: "Introduction", colour: Color(.systemIndigo))
                
                SubheadingView(text: sqlInjectionData.intro)
                
                HeadingTextView(text: "What is SQL?", colour: Color(.systemIndigo))
                
                SubheadingView(text: sqlInjectionData.section1)
                
                SQLTextView(sqlCode: sqlInjectionData.query1)
                
                SubheadingView(text: "Let's break this query down...")
                
                Group {
                    HStack { // <- SELECT
                        SQLTextView(sqlCode: "SELECT")
                            .frame(width: 100)
                        
                        Spacer()
                        
                        Subheading2View(text: sqlInjectionData.selectDescription)
                    }
                    
                    Divider()
                    
                    HStack { // <- username
                        SQLTextView(sqlCode: "username")
                            .frame(width: 140)
                        
                        Spacer()
                        
                        Subheading2View(text: sqlInjectionData.usernameDescription)
                    }
                    
                    Divider()
                    
                    HStack { // <- FROM
                        SQLTextView(sqlCode: "FROM")
                            .frame(width: 100)
                        
                        Spacer()
                        
                        Subheading2View(text: sqlInjectionData.fromDescription)
                    }
                    
                    Divider()
                    
                    HStack { // <- users
                        SQLTextView(sqlCode: "users")
                            .frame(width: 110)
                        
                        Spacer()
                        
                        Subheading2View(text: sqlInjectionData.usersDescription)
                    }
                    
                    Divider()
                    
                    HStack { // <- semicolon
                        SQLTextView(sqlCode: ";")
                            .frame(width: 70)
                        
                        Spacer()
                        
                        Subheading2View(text: sqlInjectionData.semiColonDescription)
                    }
                    .padding()
              
                }
                .padding(.top, 20)
                
                SubheadingView(text: "Now that you have a basic understanding of SQL, let's move on to SQL injections on the next page...")
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
