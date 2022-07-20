//
//  SignInViewModel.swift
//  Twitter
//
//  Created by Kerby Jean on 7/20/22.
//

import Combine
import FirebaseAuth
import Foundation

class SignInViewModel: ObservableObject {
    
    var authService = AuthService()
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var validationMessages = [String]()
    @Published var navigationAllowed: Bool = false
    
    var submitAllowed: AnyPublisher<Bool, Never> {
        $emailAddress.combineLatest($password) {
            $0.count > 1 && $1.count > 1
        }
        .eraseToAnyPublisher()
    }
    
    func signIn() {
        authService.signIn(email: emailAddress, password: password) {[weak self] authResult, error in
            if let error = error {
                self?.validationMessages.append(error.localizedDescription)
            } else {
                self?.navigationAllowed = true
            }
        }
    }
}
