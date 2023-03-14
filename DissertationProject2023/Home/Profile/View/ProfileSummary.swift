//
//  ProfileSummary.swift
//  DissertationProject2023
//
//  Created by Louis on 13/03/2023.
//

import SwiftUI

/*
 
 To fetch logged in user's info:
 Text("Username: \(sessionService.userDetails?.userName ?? "N/A")")
 Text("Email: \(sessionService.userDetails?.email ?? "N/A")")
 
 To log out user:
 ButtonView(title: "Logout"){
     sessionService.logout()
 }
 
 */

struct ProfileSummary: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 15) {
                Text("Username: \(sessionService.userDetails?.userName ?? "N/A")")
                Text("Email: \(sessionService.userDetails?.email ?? "N/A")")
                
                ButtonView(title: "Logout", background: colorScheme == .light ? .black : .white, foreground: colorScheme == .light ? .white : .black){
                    sessionService.logout()
                }
                Divider()
                Spacer()

            }
            .padding()
            .navigationTitle("\(sessionService.userDetails?.userName ?? "User")'s Profile")
            .applyClose()
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary()
            .environmentObject(SessionServiceImpl())
    }
}
