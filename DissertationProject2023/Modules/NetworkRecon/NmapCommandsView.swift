//
//  NmapCommandsView.swift
//  DissertationProject2023
//
//  Created by Louis on 19/04/2023.
//

import SwiftUI

struct NmapCommandsView: View {
    
    let commandToDisplay: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                
                
                switch (commandToDisplay){
                    
                case 1:
                    
                    (
                        Text("nmap ")
                        +
                        Text("[target IP range]")
                            .foregroundColor(.pink)
                    )
                    .font(.system(.body, design: .monospaced))
                    
                    
                case 2:
                    
                    (
                        Text("nmap -sn ")
                        +
                        Text("[target IP range]")
                            .foregroundColor(.pink)
                    )
                    .font(.system(.body, design: .monospaced))
                    
                case 3:
                    
                    (
                        Text("nmap -sV ")
                        +
                        Text("[target IP range]")
                            .foregroundColor(.pink)
                    )
                    .font(.system(.body, design: .monospaced))
                    
                case 4:
                    
                    (
                        Text("nmap -O ")
                        +
                        Text("[target IP range]")
                            .foregroundColor(.pink)
                    )
                    .font(.system(.body, design: .monospaced))
                
                default:
                    Text("N/A")
                    font(.system(.body, design: .monospaced))
                    
                }
       
            }

        }
        .padding()
        .background(.black)
        .cornerRadius(15)
        .foregroundColor(.white)
    }
}

struct NmapCommandsView_Previews: PreviewProvider {
    static var previews: some View {
        NmapCommandsView(commandToDisplay: 1)
    }
}
