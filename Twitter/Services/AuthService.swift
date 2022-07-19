//
//  AuthService.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Foundation
import FirebaseAuth

// Test user for authentication
/*
 Email: user1@gmail.com
 Password: 123456
*/

class AuthService {
    
    init() { }
    
    func signUp(email: String, password: String, username: String, _ completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                completion(nil, error)
            }
            // TODO: - Save username to database
            completion(authResult, nil)
        }
    }
    
    func signIn(email: String, password: String, _ completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                completion(nil, error)
            }
            completion(authResult, nil)
        }
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
