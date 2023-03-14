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
            VStack (alignment: .leading, spacing: 15){
                Text("Introduction")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(sqlInjectionData.intro)
                    .font(.callout)
                
                Spacer()
                
                Text("What is SQL?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(sqlInjectionData.section1)
                    .font(.callout)
                
                Spacer()
                
                Image("query1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Capsule())
                
                Spacer()
                
                Text("Let's break this query down...")
                    .font(.callout)
                
                Group {
                    HStack { // <- SELECT
                        Image("select")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Capsule())
                            .frame(height: 25)
                        
                        Spacer()

                        Text(sqlInjectionData.selectDescription)
                            .font(.caption)
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
                            .font(.caption)
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
                            .font(.caption)
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
                            .font(.caption)
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
                            .font(.caption)
                    }
                }
                .padding()
                

                
            }
            .foregroundColor(.black)


        }
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
