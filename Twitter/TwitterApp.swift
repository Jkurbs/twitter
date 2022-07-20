//
//  TwitterApp.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//


import SwiftUI
import FirebaseAuth

@main
struct TwitterApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if Auth.auth().currentUser?.uid != nil {
                    FeedView()
                } else {
                    SignUpView()
                }
            }
        }
    }
}
