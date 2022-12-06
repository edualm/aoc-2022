//
//  Runner.swift
//  Utilities
//
//  Created by Eduardo Almeida on 02/12/2021.
//

import Foundation

public struct Runner {
    
    typealias TimeStartEnd = (start: DispatchTime, end: DispatchTime?)
    
    private func calculateMs(from timeStartEnd: TimeStartEnd) -> Double? {
        guard let end = timeStartEnd.end else {
            return nil
        }
        
        return Double(end.uptimeNanoseconds - timeStartEnd.start.uptimeNanoseconds) / 1_000_000
    }
    
    let challengeType: RunnableChallenge.Type
    
    public init(challengeType: RunnableChallenge.Type) {
        self.challengeType = challengeType
    }
    
    public func challengeInput(inputIsCommaSeparated: Bool = true, overrideFileName: String? = nil) throws -> [[String]] {
        let arguments = ProcessInfo.processInfo.arguments
        
        let fileName: String
        
        if let overrideFileName = overrideFileName {
            fileName = overrideFileName
        } else {
            fileName = arguments.count >= 2 ? arguments[1] : "input.txt"
        }
        
        return try IOUtilities.readInput(fileName: fileName, isCommaSeparated: inputIsCommaSeparated)
    }
    
    public func run(inputIsCommaSeparated: Bool = true) {
        do {
            let challenge = challengeType.init(input: try challengeInput(inputIsCommaSeparated: inputIsCommaSeparated))
            
            print("\(Banner.with(day: challenge.day))\n")
            
            var firstPartTime: TimeStartEnd = (DispatchTime.now(), nil)
            
            if let answer = challenge.part1() {
                firstPartTime.end = DispatchTime.now()
                
                if let time = calculateMs(from: firstPartTime) {
                    print("Part 1 answer: \(answer) (took \(time) ms)")
                } else {
                    print("Part 1 answer: \(answer) (unable to calculate time)")
                }
            }
            
            var secondPartTime: TimeStartEnd = (DispatchTime.now(), nil)
            
            if let answer = challenge.part2() {
                secondPartTime.end = DispatchTime.now()
                
                if let time = calculateMs(from: secondPartTime) {
                    print("Part 2 answer: \(answer) (took \(time) ms)")
                } else {
                    print("Part 2 answer: \(answer) (unable to calculate time)")
                }
            }
        } catch {
            print("❌ Execution Error: \(error)")
        }
    }
}
