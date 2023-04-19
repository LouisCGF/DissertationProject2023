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
                
                SubheadingView(text: "Below is a simulated login portal. The input boxes are vulnerable to an SQL Injection attack as they do not properly validate the input. ")
                
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
                        if (email == "'" || password == "'"){ // <- SQL Error
                            showLoginText = true
                            loginText = "SQL Syntax Error"
                            descriptionText = "It says there's an error with SQL. That's because an apostrophe was entered, resulting in the query being malformed. Have a look at the query below to see what's now happening in the backend. Everything after 'username = ' is now a string, resulting in an invalid SQL query. Since the login portal is telling us that there is an SQL syntax error, we know that the input boxes aren't validated and we can bypass the login with a cleverly formed SQL query. In either input box, enter ' OR 1=1 --, and see what happens..."
                            queryText = "SELECT * FROM users WHERE username = '''ANDpassword=''';"
                            showSQLQuery = true
                            
                        } else if (email == "' OR 1=1 --" || password == "' OR 1=1 --"){ // <- Successful login
                            loginSuccessful = true
                            showLoginText = false
                            loginText = ""
                            loginOrLogout = "Logout"
                            email = ""
                            password = ""
                            showSQLQuery = true
                            queryText = "SELECT * FROM users WHERE username = '' OR 1=1 --'ANDpassword=''"
                            descriptionText = "We're in! You successfully bypassed the login system by injecting a cleverly crafted malcious SQL payload. Have a look at how the query looks now."
                            descriptionOfQuery = "As you can see, the apostrophe at the beginning closes the string for username. This now makes the OR 1=1 condition active SQL code, and it always evaluates as true, bypassing the intended authentication mechanism. The -- portion comments out the remaining part of the query, effectively ignoring the password check. Consequently, the attacker gains unauthorized access to the application.\n\nLet's continue on the page where we learn a bit about how we can defend our databases from SQL injections..."
                            
                        } else if (loginOrLogout == "Logout") { // <-- Logs out
                            loginSuccessful = false
                            loginOrLogout = "Login"
                            showSQLQuery = false
                            
                        } else { // <- Incorrect details
                            showLoginText = true
                            loginText = "Incorrect email or password"
                            descriptionText = "As you can see, it tells us that we entered something wrong, as it should. Now enter a single apostrophe (') into either input box and see what happens."
                            showSQLQuery = false
                        }
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
}

struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Page3()
    }
}
