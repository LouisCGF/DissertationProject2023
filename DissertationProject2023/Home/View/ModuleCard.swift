//
//  ModuleCard.swift
//  DissertationProject2023
//
//  Created by Louis on 13/03/2023.
//

import SwiftUI

struct ModuleCard: View {
    
    var module: Module
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(15)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .frame(width: 350)
            
            CircleImage(image: module.image)
                .frame(height: 200)
                .offset(y: -145)
                .padding()

            VStack (alignment: .leading){
                HStack {
                    Text(module.title)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.top, 90)
                .padding(.leading)
                
                HStack {
                    Text(module.shortDescription)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.4)
                    Spacer()
                }
                .padding()
            }

        }
        .padding()
    }
    
}

struct ModuleCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ModuleCard(module: ModelData().modules[0])
                .previewDisplayName("SQL")
            
            ModuleCard(module: ModelData().modules[1])
                .previewDisplayName("Network Recon")
            
            ModuleCard(module: ModelData().modules[2])
                .previewDisplayName("XSS")
            
            ModuleCard(module: ModelData().modules[3])
                .previewDisplayName("Password")
            
            ModuleCard(module: ModelData().modules[4])
                .previewDisplayName("OSINT")
            
            ModuleCard(module: ModelData().modules[5])
                .previewDisplayName("Legal")
        }

    }
}
