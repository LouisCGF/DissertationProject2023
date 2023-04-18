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
                
                Text("Introduction")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(Color(.systemIndigo))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                Text(sqlInjectionData.intro)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 5)
                
                Text("What is SQL?")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(Color(.systemIndigo))
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                Text(sqlInjectionData.section1)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.leading)
                //.padding([.leading, .trailing], 30)
                    .padding(.top, 5)
                
                Image("query1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Capsule())
                    .padding()
                
                Text("Let's break this query down...")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.leading)
                //.padding([.leading, .trailing], 30)
                    .padding(.top, 5)
                
                Group {
                    HStack { // <- SELECT
                        Image("select")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Capsule())
                            .frame(height: 25)
                        
                        Spacer()
                        
                        Text(sqlInjectionData.selectDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.leading)
                        //.padding([.leading, .trailing], 30)
                            .padding(.top, 5)
                    }
                    
                    Divider()
                    
                    HStack { // <- username
                        Image("username")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Capsule())
                            .frame(height: 25)
                        
                        Spacer()
                        
                        Text(sqlInjectionData.usernameDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.leading)
                        //.padding([.leading, .trailing], 30)
                            .padding(.top, 5)
                    }
                    
                    Divider()
                    
                    HStack { // <- FROM
                        Image("from")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Capsule())
                            .frame(height: 25)
                        
                        Spacer()
                        
                        Text(sqlInjectionData.fromDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.leading)
                        //.padding([.leading, .trailing], 30)
                            .padding(.top, 5)
                    }
                    
                    Divider()
                    
                    HStack { // <- users
                        Image("users")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Capsule())
                            .frame(height: 25)
                        
                        Spacer()
                        
                        Text(sqlInjectionData.usersDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.leading)
                        //.padding([.leading, .trailing], 30)
                            .padding(.top, 5)
                    }
                    
                    Divider()
                    
                    HStack { // <- users
                        Image("semi-colon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Capsule())
                            .frame(height: 25)
                            .padding(.trailing, 50)
                        
                        Text(sqlInjectionData.semiColonDescription)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.leading)
                        //.padding([.leading, .trailing], 30)
                            .padding(.top, 5)
                    }
                    .padding()
                    
                    
                    
                }
                .padding(.top, 20)
            }
            .padding()
            .foregroundColor(.black)
            
        }
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
