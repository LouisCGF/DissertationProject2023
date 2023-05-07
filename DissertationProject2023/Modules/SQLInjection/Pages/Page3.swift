//
//  Page3.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct Page3: View {
    
    private let sqlInjectionData = ModelData().sqlInjectionData[0]
    
    @State var descriptionText = "Type anything into the email or password fields and click login to see what happens"
    
    @State var loginText = ""
    @State var loginOrLogout = "Login"
    
    @State var showLoginText = false
    
    @State var email = ""
    @State var password = ""
    
    @State var loginSuccessful = false
    @State var showSQLQuery = false
    
    @State var queryText = ""
    
    @State var descriptionOfQuery = ""
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HeadingTextView(text: "Executing an attack", colour: Color(.systemIndigo))
                
                SubheadingView(text: sqlInjectionData.section4_1)
                
                Divider()
                    .padding()
                
                Group {
                    SubheadingView(text: descriptionText)
                    
                    if (showSQLQuery){
                        SQLTextView(sqlCode: queryText)
                    }
                    
                }
                
                Group {
                    
                    if (loginSuccessful) {
                        LoginSuccessfulView()
                            .offset(x: 45)
                            .padding()
                    } else {
                        LoginPortalView(email: $email, password: $password)
                            .padding()
                    }
                
                }
            
                
                Group {
                    if (showLoginText){
                        Text(loginText)
                            .foregroundColor(.red)
                            .padding(1)
                            .offset(x: 20)
                    }
                    
                    ButtonView(title: loginOrLogout, background: .black, foreground: .white){
                        executeLogin()
                    }
                    .aspectRatio(contentMode: .fit)
                    .padding()
                }
                
                SubheadingView(text: descriptionOfQuery)
            
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .background(.white)
        
    }
    
    private func executeLogin() {
        
        if (email == "'" || password == "'"){ // <- SQL Error
            showLoginText = true
            loginText = "SQL Syntax Error"
            descriptionText = sqlInjectionData.section4_5
            queryText = sqlInjectionData.query6
            showSQLQuery = true
            
        } else if (email == sqlInjectionData.query4 || password == sqlInjectionData.query4){ // <- Successful login
            loginSuccessful = true
            showLoginText = false
            loginText = ""
            loginOrLogout = "Logout"
            email = ""
            password = ""
            showSQLQuery = true
            queryText = sqlInjectionData.query7
            descriptionText = sqlInjectionData.section4_4
            descriptionOfQuery = sqlInjectionData.section4_3
            
        } else if (loginOrLogout == "Logout") { // <-- Logs out
            loginSuccessful = false
            loginOrLogout = "Login"
            showSQLQuery = false
            
        } else { // <- Incorrect details
            showLoginText = true
            loginText = "Incorrect email or password"
            descriptionText = sqlInjectionData.section4_2
            showSQLQuery = false
        }
        
    }
}

struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Page3()
    }
}
