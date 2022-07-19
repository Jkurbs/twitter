//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Combine
import FirebaseAuth
import Foundation

class AuthViewModel: ObservableObject {
    
    var authService = AuthService()
    
    @Published var username: String = ""
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var user: User? = nil
    

    init() { }

    func signIn() {
        authService.signIn(email: "kerby.jean@hotmail.fr", password: "123456") { authResult, error in
          
        }
    }
    
    func logOut() {
        
    }
}
