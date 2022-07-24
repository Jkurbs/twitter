//
//  TimelineViewModelSpec.swift
//  TwitterTests
//
//  Created by Kerby Jean on 7/19/22.
//

import Quick
import Nimble
@testable import Twitter

class TimelineViewModelSpec: QuickSpec {}

// MARK: - Tests
extension TimelineViewModelSpec {
    override func spec() {
        
        var subject: TimelineViewModel!
        beforeEach { subject = .init() }

        describe("loadTimeline()") {
            context("When load timeline is called tweets are no longer nil") {
                beforeEach { subject.loadTimeline() }
                it("sets tweets") {
                    expect(subject.tweets).toEventuallyNot(beNil(), timeout: .seconds(Int(1.5)))
                }
            }
        }
    }
}

