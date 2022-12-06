//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 6
    
    let input: String
    
    public init(input: [[String]]) {
        self.input = input.first!.first!
    }
    
    public func part1() -> String? {
        for i in 0 ..< input.count {
            if Set(arrayLiteral: input[i], input[i + 1], input[i + 2], input[i + 3]).count == 4 {
                return "\(i + 4)"
            }
        }
        
        return nil
    }

    public func part2() -> String? {
        for i in 0 ..< input.count {
            if Set(
                arrayLiteral:
                    input[i], input[i + 1], input[i + 2], input[i + 3],
                    input[i + 4], input[i + 5], input[i + 6], input[i + 7],
                    input[i + 8], input[i + 9], input[i + 10], input[i + 11],
                    input[i + 12], input[i + 13]
            ).count == 14 {
                return "\(i + 14)"
            }
        }
        
        return nil
    }
}
