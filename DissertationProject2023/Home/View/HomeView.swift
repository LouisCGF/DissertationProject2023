//
//  HomeView.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 16){
            
            VStack (alignment: .leading, spacing: 16) {
                Text("Username: <Placeholder>")
                Text("Email: <Placerholder")
                
            }
            
            ButtonView(title: "Logout"){
                 
            }
            
        }
        .padding(.horizontal, 16)
        .navigationTitle("Main ContentView")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
