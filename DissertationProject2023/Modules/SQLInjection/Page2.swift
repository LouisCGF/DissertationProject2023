//
//  Page2.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct Page2: View {
    
    private let sqlInjectionData = ModelData().sqlInjectionData[0]
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                Group {
                    HeadingTextView(text: "What is an SQL injection?", colour: Color(.systemIndigo))
                    
                    SubheadingView(text: sqlInjectionData.section2)
                    
                    HeadingTextView(text: "How an SQL Injection is executed", colour: Color(.systemIndigo))
                    
                    SubheadingView(text: sqlInjectionData.section3)
                    
                    SubheadingView(text: sqlInjectionData.section3_1)
                    
                    SubheadingView(text: sqlInjectionData.section3_2)
                    
                    SQLTextView(sqlCode: "SELECT * FROM users WHERE username = '[INPUT_USERNAME]' AND password = '[INPUT_PASSWORD]';")
                    
                    SubheadingView(text: sqlInjectionData.section3_3)
                    
                }
                
                Group {
                    
                    SQLTextView(sqlCode: "username: johndoe")
                    SQLTextView(sqlCode: "password: mySecurePass")
                        .offset(y: -25)
                    
                    SubheadingView(text: sqlInjectionData.section3_4)
                    
                    SQLTextView(sqlCode: "SELECT * FROM users WHERE username = 'johndoe' AND password = 'mySecurePass';")
                    
                    SubheadingView(text: sqlInjectionData.section3_5)
                    
                    SQLTextView(sqlCode: "' OR 1=1 --")
                    
                    SubheadingView(text: sqlInjectionData.section3_6)
                    
                    SQLTextView(sqlCode: "SELECT * FROM users WHERE username = '' OR 1=1 --'AND‎‎‎‎ㅤㅤㅤㅤ‎password='[INPUT_PASSWORD]';")
                    
                    SubheadingView(text: sqlInjectionData.section3_7)
                    
                    SubheadingView(text: "On the next page you'll be able to try this attack yourself on a simulated login system")
                }
                
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
}

struct Page2_Previews: PreviewProvider {
    static var previews: some View {
        Page2()
    }
}
