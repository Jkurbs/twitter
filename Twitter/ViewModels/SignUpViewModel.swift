//
//  SignUpViewModel.swift
//  Twitter
//
//  Created by Kerby Jean on 7/19/22.
//

import Combine
import FirebaseAuth
import Foundation

class SignUpViewModel: ObservableObject {
    
    var authService = AuthService()
    
    @Published var username: String = ""
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var validationMessages = [String]()
    @Published var navigationAllowed: Bool = false
    
    var submitAllowed: AnyPublisher<Bool, Never> {
        $username.combineLatest($password) {
            $0.count > 3 && $1.count > 5
        }
        .eraseToAnyPublisher()
    }
    
    func signUp() {
        authService.signUp(email: emailAddress, password: password, username: username) {[weak self] authResult, error in
            if let error = error {
                self?.validationMessages.append(error.localizedDescription)
            } else {
                self?.navigationAllowed = true
            }
        }
    }
}
