//
//  LoginPage.swift
//  DissertationProject2023
//
//  Created by Louis on 02/03/2023.
//

import SwiftUI

struct WelcomePageView: View {
    
    
    @State var index = 0
    
    var body: some View {
        ZStack {
            
            Color.white
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.white, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                .rotationEffect(.degrees(-180))
                .offset(x: -0, y: -350)

            VStack{
                
                // Welcome Text
                VStack (alignment: .leading) {
                    
                    Image(systemName: "circle.dashed")
                        .font(.system(size: 38))
                        .foregroundColor(.green)
                    
                    (Text("Welcome,")
                        .font(.title)
                        .foregroundColor(.black) +
                     Text("\nLogin or Sign Up")
                        .font(.title)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.01, brightness: 0.822)))
                    .fontWeight(.semibold)
                    .lineSpacing(10)
                    .padding(.top, 20)
                    .padding(.trailing, 90)
                    
                    
                }
                .padding(.bottom, 60)
                
                
                
                LoginAndSignupView()
                
                
                
            }
            
        
            
        }
        .padding(.top, 60)
        .ignoresSafeArea()
        

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
