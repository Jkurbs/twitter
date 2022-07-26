//
//  TwitterApp.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//


import SwiftUI

@main
struct TwitterApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if TwitterClient.shared.isLoggedIn.value {
                    TimelineView(authViewModel: AuthViewModel())
                } else {
                    LogInView()
                }
            }
        }
    }
}
