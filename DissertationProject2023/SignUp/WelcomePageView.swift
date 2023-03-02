//
//  LoginPage.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        ZStack {
            
            // Gradient Background
            Color.white
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle( .linearGradient(colors: [.black, .white], startPoint: .topLeading, endPoint: .bottomTrailing) )
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            // Welcome Text
            
            VStack (alignment: .leading) {
                
                Image(systemName: "circle.dashed")
                    .font(.system(size: 38))
                    .foregroundColor(.green)
                
                (Text("Welcome,")
                    .font(.title)
                    .foregroundColor(.black) +
                 Text("\nGet Started or Sign In")
                    .font(.title)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.01, brightness: 0.822)))
                .fontWeight(.semibold)
                .lineSpacing(10)
                .padding(.top, 20)
                .padding(.trailing, 65)
                
                Spacer()
                
               
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                //SignUpItemsGroupView()
                
                // Get Started button
                Button{
                    
                } label: {
                    PrimaryButton(title: "Get Started", textColor: .white, backgroundColor: .gray)
                }
                
                
                // Sign In button
                Button {
                    
                } label: {
                    PrimaryButton(title: "Sign In", textColor: .black, backgroundColor: .white)
                        .padding(.vertical)
                }
                
            }
            .padding()
            
            
            
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}

struct PrimaryButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .frame(maxWidth: 300)
            .padding()
            .background(backgroundColor)
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.8), radius: 60, x: 0.0, y: 0.0)
    }
}
