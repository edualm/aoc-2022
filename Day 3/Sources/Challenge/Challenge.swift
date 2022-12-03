//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 3
    
    let input: [String]
    
    public init(input: [[String]]) {
        self.input = input.first!
    }
    
    public func part1() -> String? {
        let inCommon = input.map {
            let prefix = $0.prefix($0.count / 2)
            let suffix = $0.suffix($0.count / 2)
            
            let inCommon = prefix.compactMap {
                if suffix.contains($0) {
                    return $0
                }
                
                return nil
            }
            
            return inCommon.first!.priority
        }.reduce(0, +)
        
        return "\(inCommon)"
    }

    public func part2() -> String? {
        var grouped: [[String]] = []
        
        var i = 0
        
        while true {
            if input.count <= (i * 3) {
                break
            }
            
            grouped.append([input[i * 3], input[i * 3 + 1], input[i * 3 + 2]])
            
            i += 1
        }
        
        let inCommon = grouped.map {
            let first = $0[0]
            let second = $0[1]
            let third = $0[2]
            
            let intersection = first.compactMap {
                if second.contains($0) && third.contains($0) {
                    return $0
                }
                
                return nil
            }
            
            return intersection.first!.priority
        }.reduce(0, +)
        
        return "\(inCommon)"
    }
}
