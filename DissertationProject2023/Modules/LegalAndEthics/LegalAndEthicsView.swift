//
//  LegalAndEthicsView.swift
//  DissertationProject2023
//
//  Created by Louis on 14/03/2023.
//

import SwiftUI

struct LegalAndEthicsView: View {
    
    @State private var selectedItem = 1
    @State private var fullscreen = false
    
    var body: some View {
        
        VStack {
            
            ZStack (alignment: .leading){
                
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 130)
                    .ignoresSafeArea()
                
                TabView (selection: $selectedItem) {
                    
                    LEPage1()
                        .tag(1)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                    
                    
                    LEPage2()
                        .tag(2)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                    
                    
                    LEPage3()
                        .tag(3)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                    
                    
                    LEPage4()
                        .tag(4)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                    
                    LEPage5()
                        .tag(5)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                        .onTapGesture {
                            fullscreen.toggle()
                        }
                     
                    
                }
                .padding()
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                CircleImage(image: Image("legal-and-ethics-module-img"))
                    .frame(height: 100)
                    .offset(x: 140, y: -300)
                    .padding()
                
                Image(systemName: "viewfinder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .offset(x: 330, y: 300)
                    .onTapGesture {
                        fullscreen.toggle()
                    }
                
                ProgressView("", value: (Double(selectedItem) / 5) * 100, total: 100)
                    .foregroundColor(.white)
                    .tint(.green)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 100)
                    .offset(y: 380)
                
            }
            .sheet(isPresented: $fullscreen) {
                
                switch (selectedItem){
                case 1:
                    LEPage1()
                case 2:
                    LEPage2()
                case 3:
                    LEPage3()
                case 4:
                    LEPage4()
                case 5:
                    LEPage5()
                default:
                    LEPage1()
                }
                 
            }
            
        }
        
    }
}

struct LegalAndEthicsView_Previews: PreviewProvider {
    static var previews: some View {
        LegalAndEthicsView()
    }
}
