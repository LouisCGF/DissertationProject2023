//
//  PHPTextView.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct PHPTextView: View {
    
    var body: some View {
        
        ScrollView (.vertical){
            VStack (alignment: .leading){
                
                HStack {
                    Text("$sql")
                        .foregroundColor(.pink)
                    
                    Text("=")
                        .foregroundColor(.white)
                    
                    (
                        Text("'INSERT INTO users (username, email) VALUES (:username, :email)'")
                        .foregroundColor(.green)
                    +
                    Text(";")
                        .foregroundColor(.white)
                    )
                }
                
                
                HStack {
                    Text("$stmt")
                        .foregroundColor(.pink)
                    
                    Text("=")
                        .foregroundColor(.white)
                    
                    (
                        Text("$pdo")
                            .foregroundColor(.pink)
                        +
                        Text("->")
                            .foregroundColor(.white)
                        +
                        Text("prepare")
                            .foregroundColor(.red)
                        +
                        Text("(")
                            .foregroundColor(.white)
                        +
                        Text("$sql")
                            .foregroundColor(.pink)
                        +
                        Text(")")
                            .foregroundColor(.white)
                        +
                        Text(";")
                            .foregroundColor(.white)
                    )
   
                }
                
                HStack {
                    
                    (
                        Text("$stmt")
                            .foregroundColor(.pink)
                        +
                        Text("->")
                            .foregroundColor(.white)
                        +
                        Text("bindParam")
                            .foregroundColor(.red)
                        +
                        Text("(")
                            .foregroundColor(.white)
                        +
                        Text("':username'")
                        .foregroundColor(.green)
                        +
                        Text(",")
                            .foregroundColor(.white)
                    )
                    
                    (
                        Text("$username")
                            .foregroundColor(.pink)
                        +
                        Text(")")
                            .foregroundColor(.white)
                        +
                        Text(";")
                            .foregroundColor(.white)
                    )
                    
                    
                }
                
                HStack {
                    
                    (
                        Text("$stmt")
                            .foregroundColor(.pink)
                        +
                        Text("->")
                            .foregroundColor(.white)
                        +
                        Text("bindParam")
                            .foregroundColor(.red)
                        +
                        Text("(")
                            .foregroundColor(.white)
                        +
                        Text("':email'")
                        .foregroundColor(.green)
                        +
                        Text(",")
                            .foregroundColor(.white)
                    )
                    
                    (
                        Text("$email")
                            .foregroundColor(.pink)
                        +
                        Text(")")
                            .foregroundColor(.white)
                        +
                        Text(";")
                            .foregroundColor(.white)
                    )
                    
                    
                }
                
                HStack {
                    
                    (
                        Text("$stmt")
                            .foregroundColor(.pink)
                        +
                        Text("->")
                            .foregroundColor(.white)
                        +
                        Text("execute")
                            .foregroundColor(.red)
                        +
                        Text("(")
                            .foregroundColor(.white)
                        +
                        Text(")")
                            .foregroundColor(.white)
                        +
                        Text(";")
                            .foregroundColor(.white)
                    )
                    
                }
                
                
            }
            .padding()
            .font(.system(size: 10, weight: .medium, design: .rounded))
        }
        .background(.black)
        
    }
}




struct PHPTextView_Previews: PreviewProvider {
    static var previews: some View {
        PHPTextView()
    }
}
