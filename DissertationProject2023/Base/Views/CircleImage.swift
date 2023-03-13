//
//  CircleImage.swift
//  DissertationProject2023
//
//  Created by Louis on 13/03/2023.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        
        Circle()
            .strokeBorder(Color.black,lineWidth: 4) // Circle border colour
            .background(
                ZStack{
                    Circle().foregroundColor(Color.white) // Colour inside the circle
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                }
            )
            .shadow(radius: 7)

        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleImage(image: Image("sql-injection-module-img"))
                .preview(with: "SQL")
            
            CircleImage(image: Image("network-recon-module-img"))
                .preview(with: "Netork Recon")
            
            CircleImage(image: Image("legal-and-ethics-module-img"))
                .preview(with: "Legal and Ethics")
            
            CircleImage(image: Image("osint-module-img"))
                .preview(with: "OSINT")
            
            CircleImage(image: Image("password-cracking-module-img"))
                .preview(with: "Password Cracking")
            
            CircleImage(image: Image("xss-module-img"))
                .preview(with: "XSS")
        }
        

    }
}
