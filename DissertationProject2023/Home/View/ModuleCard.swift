//
//  ModuleCard.swift
//  DissertationProject2023
//
//  Created by Louis on 13/03/2023.
//

import SwiftUI

struct ModuleCard: View {
    
    var module: Module
    var colour: Color?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .aspectRatio(3/2, contentMode: .fit)
                .foregroundColor(colour ?? .gray)
                .frame(width: 350)
            
            HStack {
                CircleImage(image: module.image)
                    .frame(height: 100)
                    .offset(x: 140, y: -95)
                    .padding()
            }
            
            VStack (alignment: .leading){
                Text(module.title)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                
                
                Text(module.shortDescription)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                
                Text("Progress")
                    .foregroundColor(.white)
                    .font(.caption)
                    .padding(.bottom, -10)
                    .opacity(0.7)
                    .fontWeight(.heavy)
                ProgressView("", value: 15, total: 100)
                    .foregroundColor(.white)
                    .tint(.green)
            }
            .padding()


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
