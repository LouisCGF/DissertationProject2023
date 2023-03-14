//
//  HomeView.swift
//  DissertationProject2023
//
//  Created by Louis on 03/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    @EnvironmentObject var modelData: ModelData
    
    @State private var showingProfile = false
    
    var body: some View {
 
        NavigationView {
            List {
                ForEach( Array(modelData.modules) ) { module in
                    NavigationLink{
                        ModuleViewHandler(module: module)
                    } label: {
                        ModuleCard(module: module)
                            .padding(.top, 70)
                            .padding(.leading, 15)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color("loginBackgroundColor"), Color("loginBackgroundColor2")]), startPoint: .leading, endPoint: .trailing)
                        )
                )
            }
            .listStyle(.inset)
            .navigationTitle("Modules")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileSummary()
                    .environmentObject(sessionService)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {

        HomeView()
            .environmentObject(SessionServiceImpl())
            .environmentObject(ModelData())

    }
}
