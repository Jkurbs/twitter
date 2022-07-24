//
//  TwitterUITests.swift
//  TwitterUITests
//
//  Created by Kerby Jean on 7/19/22.
//

import XCTest

class TwitterUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginButton_loginEnabled() {
        app.launch()
        let usernameField = app.textFields["Username"]
        usernameField.tap()
        usernameField.typeText("user")
        let passwordField = app.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("password")
        XCTAssertTrue(app.buttons["logIn"].isEnabled)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
