//
//  DissertationProject2023App.swift
//  DissertationProject2023
//
//  Created by Louis on 01/03/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct DissertationProject2023App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionServiceImpl()
    @StateObject var googleViewModel = GoogleSignInViewModel()
    @StateObject var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {

            switch sessionService.state {
            case .loggedIn:
                HomeView()
                    .environmentObject(sessionService)
                    .environmentObject(modelData)
            case .loggedOut:
                LoginView()
                    .environmentObject(googleViewModel)
            }
            
        }
    }
}
