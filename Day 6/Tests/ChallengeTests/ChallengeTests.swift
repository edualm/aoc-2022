//
//  ChallengeTests.swift
//  ChallengeTests
//

import XCTest
import Utilities

@testable import Challenge

final class ChallengeTests: XCTestCase {
    
    func testPart1() throws {
        XCTAssertEqual(Challenge(input: [["mjqjpqmgbljsphdztnvjfqwrcgsmlb"]]).part1(), "7")
        XCTAssertEqual(Challenge(input: [["bvwbjplbgvbhsrlpgdmjqwftvncz"]]).part1(), "5")
        XCTAssertEqual(Challenge(input: [["nppdvjthqldpwncqszvftbrmjlhg"]]).part1(), "6")
        XCTAssertEqual(Challenge(input: [["nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"]]).part1(), "10")
        XCTAssertEqual(Challenge(input: [["zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"]]).part1(), "11")
    }
    
    func testPart2() throws {
        XCTAssertEqual(Challenge(input: [["mjqjpqmgbljsphdztnvjfqwrcgsmlb"]]).part2(), "19")
        XCTAssertEqual(Challenge(input: [["bvwbjplbgvbhsrlpgdmjqwftvncz"]]).part2(), "23")
        XCTAssertEqual(Challenge(input: [["nppdvjthqldpwncqszvftbrmjlhg"]]).part2(), "23")
        XCTAssertEqual(Challenge(input: [["nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"]]).part2(), "29")
        XCTAssertEqual(Challenge(input: [["zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"]]).part2(), "26")
    }
}
