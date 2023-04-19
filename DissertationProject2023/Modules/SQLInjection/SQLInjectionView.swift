//
//  SQLInjectionView.swift
//  DissertationProject2023
//
//  Created by Louis on 14/03/2023.
//

import SwiftUI

struct SQLInjectionView: View {
    
    private let sqlInjectionData = ModelData().sqlInjectionData
    
    @State private var selectedItem = 1
    @State private var fullscreen = false
    
    var body: some View {
            
        VStack {
            
            ZStack (alignment: .leading) {
                
                Rectangle()
                    .fill(.indigo)
                    .frame(width: 130)
                    .ignoresSafeArea()
                
                TabView (selection: $selectedItem) {

                    Page1()
                        .tag(1)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                    
                    
                    Page2()
                        .tag(2)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                    
                    
                    Page3()
                        .tag(3)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                    
                    Page4()
                        .tag(4)
                        .cornerRadius(15)
                        .padding(.bottom, 60)
                        .padding(.trailing, 15)
                }
                .padding()
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                CircleImage(image: Image("sql-injection-module-img"))
                    .frame(height: 100)
                    .offset(x: 140, y: -300)
                    .padding()
                
                Image(systemName: "viewfinder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .offset(x: 330, y: 300)
                    .foregroundColor(.black)
                    .onTapGesture {
                        fullscreen.toggle()
                    }
                
                ProgressView("", value: (Double(selectedItem) / 4) * 100, total: 100)
                    .foregroundColor(.white)
                    .tint(.green)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 100)
                    .offset(y: 380)
            }
            .sheet(isPresented: $fullscreen) {
                switch (selectedItem){
                case 1:
                    Page1()
                case 2:
                    Page2()
                case 3:
                    Page3()
                case 4:
                    Page4()
                default:
                    Page1()
                }
            }

            

            
        }
        .background(.white)
        //.padding(.bottom, 80)
        
        

    }
}

struct SQLInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        SQLInjectionView()
    }
}
