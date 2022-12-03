//
//  ChallengeTests.swift
//  ChallengeTests
//

import XCTest
import Utilities

@testable import Challenge

final class ChallengeTests: XCTestCase {
    
    func testPriorityValues() throws {
        XCTAssertEqual("a".first!.priority, 1)
        XCTAssertEqual("z".first!.priority, 26)
        XCTAssertEqual("A".first!.priority, 27)
        XCTAssertEqual("Z".first!.priority, 52)
    }
    
    func testPart1() throws {
        let testInput = try IOUtilities.readInput(fileName: "test.txt", isCommaSeparated: false)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part1(), "157")
    }
    
    func testPart2() throws {
        let testInput = try IOUtilities.readInput(fileName: "test.txt", isCommaSeparated: false)
        let challenge = Challenge(input: testInput)
        
        XCTAssertEqual(challenge.part2(), "70")
    }
}
