//
//  FeedTests.swift
//  TwitterTests
//
//  Created by Kerby Jean on 7/19/22.
//

import XCTest
@testable import Twitter

class TimelineTests: XCTestCase {
    
    fileprivate var sut: TimelineViewModel!
    let expectedTime = 1.5
    
    override func setUpWithError() throws {
        self.sut = TimelineViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testInit_createsTimelineViewModel() {
        XCTAssertNotNil(TimelineViewModel())
    }
    
    func testInit_setsTweetsVariable() {
        let expectation = expectation(description: "Waiting for deadline")
        DispatchQueue.main.asyncAfter(deadline: .now() + expectedTime, execute: {
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: expectedTime)
        XCTAssertNotNil(sut.tweets)
    }
}

