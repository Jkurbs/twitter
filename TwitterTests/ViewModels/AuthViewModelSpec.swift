//
//  AuthViewModelSpec.swift
//  TwitterTests
//
//  Created by Kerby Jean on 7/20/22.
//

import Quick
import Nimble
@testable import Twitter

class AuthViewModelSpec: QuickSpec {}

// MARK: - Tests
extension AuthViewModelSpec {
    
    override func spec() {
        
        var subject: AuthViewModel!
        let seconds = DispatchTimeInterval.seconds(1)
        let username = "user"
        let password = "password"
        
        beforeEach { subject = .init() }
        
        describe("loginEnabled") {
            context("login allowed when username count is more than 3 and password count more than 4") {
                beforeEach {
                    subject.username = username
                    subject.password = password
                }
                it("sets loginEnabled = `true`") {
                    expect(subject.loginEnabled).to(beTrue())
                }
            }
            
            context("login not allowed when username count is less than 3 and password count less than 4") {
                beforeEach {
                    subject.username = "user"
                    subject.password = "word"
                }
                it("sets loginEnabled = `false`") {
                    expect(subject.loginEnabled).to(beFalse())
                }
            }
        }
        
        describe("loginSucceeded") {
            context("right username and password entered") {
                beforeEach {
                    subject.username = username
                    subject.password = password
                    subject.logIn()
                }
                it("sets loginSucceeded = `true`") {
                    expect(subject.loginSucceeded).toEventually(beTrue(), timeout: seconds)
                }
            }
            
            context("wrong password or username entered") {
                beforeEach {
                    subject.username = username
                    subject.password = "wrongpassword"
                    subject.logIn()
                }
                it("sets loginSucceeded = `false`") {
                    expect(subject.loginSucceeded).to(beFalse())
                }
            }
        }
        
        describe("invalid credentials errors") {
            context("invalid username entered") {
                beforeEach {
                    subject.username = "invalidUsername"
                    subject.password = password
                    subject.logIn()
                }
                it("sets error = `Invalid username`") {
                    expect(subject.error).toEventually(equal(Error.invalidUsername), timeout: seconds)
                }
            }
            
            context("invalid password entered") {
                beforeEach {
                    subject.username = username
                    subject.password = "invalidPassword"
                    subject.logIn()
                }
                it("sets error = `Invalid password`") {
                    expect(subject.error).toEventually(equal(Error.invalidPassword), timeout: seconds)
                }
            }
        }
    }
}
