//
//  AuthTests.swift
//  TwitterTests
//
//  Created by Kerby Jean on 7/20/22.
//


import XCTest
@testable import Twitter

class AuthTests: XCTestCase {

    fileprivate var sut: MockAuthViewModel!
    var expectedTime: Double!
    
    func testLogIn_called() {
        sut.logIn()
        XCTAssertTrue(sut.startLoading)
    }
    
    func testLogIn_Allowed() {
        sut.username = generateRandomCredential()
        sut.password = generateRandomCredential()
        XCTAssertEqual(sut.username.count > 3 &&
                       sut.password.count > 4,
                       sut.loginEnabled)
    }

    func testLogIn_succeeded() {
        sut.username = "user"
        sut.password = "password"
        sut.logIn()
        waitForExpectation()
        XCTAssertTrue(sut.loginSucceeded)
    }

    func testLogIn_failed() {
        sut.logIn()
        waitForExpectation()
        XCTAssertNotNil(sut.error)
    }

    func testLogIn_error_invalidUsername() {
        sut.username = "wrongusername"
        sut.password = "password"
        sut.logIn()
        waitForExpectation()
        XCTAssertEqual(sut.error?.localizedDescription, "Invalid username")
    }

    func testLogIn_error_invalidPassword() {
        sut.username = "user"
        sut.password = "wrongpassword"
        sut.logIn()
        waitForExpectation()
        XCTAssertEqual(sut.error?.localizedDescription, "Invalid password")
    }

    func testLogOut_called() {
        sut.logOut()
        XCTAssertTrue(sut.logOutcalled)
    }

    private func waitForExpectation() {
        let expectation = expectation(description: "Waiting for deadline")
        DispatchQueue.main.asyncAfter(deadline: .now() + expectedTime, execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: expectedTime)
    }

    private func generateRandomCredential() -> String {
        let count = Int.random(in: 0...6)
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        return String((0..<count).compactMap{ _ in characters.randomElement() })
    }
}

private class MockAuthViewModel: AuthViewModel {
    var logOutcalled = false
    override func logOut() {
        logOutcalled = true
    }
}
