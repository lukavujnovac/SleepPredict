//
//  SleepPredictApp.swift
//  SleepPredict
//
//  Created by Luka Vujnovac on 15.10.2021..
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct SleepPredictApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AuthViewModel()
            HydrationView()
                .environmentObject(viewModel)
        }
    }
}
