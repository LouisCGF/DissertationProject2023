//
//  SQLInjectionView.swift
//  DissertationProject2023
//
//  Created by Louis on 14/03/2023.
//

import SwiftUI

struct SQLInjectionView: View {
    
    private let sqlInjectionData = ModelData().sqlInjectionData
    
    var body: some View {
        TabView {
            Page1()

            
            Text("Page 2")
            
            Text("Page 3")
        }
        .padding()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.918))
    }
}

struct SQLInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        SQLInjectionView()
    }
}
