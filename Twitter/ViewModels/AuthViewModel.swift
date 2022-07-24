//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Kerby Jean on 7/20/22.
//

import Combine
import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var startLoading: Bool = false
    @Published var loginEnabled: Bool = false
    @Published var loginSucceeded: Bool = false
    @Published var error: Twitter.Error?
    
    private var cancellables = Set<AnyCancellable>()
    
    var validateCredentials: AnyPublisher<Bool, Never> {
        $username.combineLatest($password) {
            $0.count > 3 && $1.count > 4
        }
        .eraseToAnyPublisher()
    }

    init() {
        validateCredentials.sink {[weak self] credentialsValidated in
            guard let self = self else { return }
            self.loginEnabled = credentialsValidated
        }
        .store(in: &cancellables)
    }
    
    func logIn() {
        startLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {[weak self] in
            guard let self = self else { return }
            TwitterClient.shared.logIn(username: self.username, password: self.password) { result in
                self.startLoading = false
                switch result {
                case .success(let succeeded):
                    self.loginSucceeded = succeeded
                case .failure(let error):
                    self.error = error as? Error
                }
            }
        }
    }
    
    func logOut() {
        TwitterClient.shared.logOut()
    }
}
