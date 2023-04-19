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
    
    var body: some View {
            
        VStack {
            
            ZStack (alignment: .leading) {
                
                Rectangle()
                    .fill(.indigo)
                    .frame(width: 130)
                    .ignoresSafeArea()
                
                TabView (selection: $selectedItem) {

                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
  
                        Page1()
                    }
                    .tag(1)
                    .padding(.bottom, 60)
                    .padding(.trailing, 15)
                    
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
  
                        Page2()
                    }
                    .tag(2)
                    .padding(.bottom, 60)
                    .padding(.trailing, 15)
                    
                    
                    Text("Page \(selectedItem)")
                        .tag(3)
                }
                .padding()
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                CircleImage(image: Image("sql-injection-module-img"))
                    .frame(height: 100)
                    .offset(x: 140, y: -300)
                    .padding()
                
                ProgressView("", value: (Double(selectedItem) / 3) * 100, total: 100)
                    .foregroundColor(.white)
                    .tint(.green)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 100)
                    .offset(y: 380)
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
