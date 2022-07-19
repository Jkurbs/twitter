//
//  AuthService.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    var provider = OAuthProvider(providerID: "twitter.com")
    @Published var user: User?
    
    init() { }
    
    func signIn() {
        provider.getCredentialWith(nil) { credential, error in
            if error != nil {
                // Handle error.
                print("Error signIn in: ", error!.localizedDescription)
            }
            if credential != nil {
                Auth.auth().signIn(with: credential!) { authResult, error in
                    if error != nil {
                        // Handle error.
                    }
                    print("Auth result: ", authResult!)
                    // User is signed in.
                    // IdP data available in authResult.additionalUserInfo.profile.
                    // Twitter OAuth access token can also be retrieved by:
                    // authResult.credential.accessToken
                    // Twitter OAuth ID token can be retrieved by calling:
                    // authResult.credential.idToken
                    // Twitter OAuth secret can be retrieved by calling:
                    // authResult.credential.secret
                }
            }
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
