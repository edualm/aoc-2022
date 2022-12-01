//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 1
    
    let input: [[String]]
    
    func runShared() -> [Int] {
        var dividedByGnome: [Int] = [];
        
        var current = 0
        
        input.first!.forEach {
            if $0 == "" {
                dividedByGnome.append(current)
                current = 0
            }
            
            current += Int($0) ?? 0
        }
        
        dividedByGnome.append(current)
        
        return dividedByGnome.sorted()
    }
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    public func part1() -> String? {
        let shared = runShared()
        
        guard !shared.isEmpty else {
            return nil
        }
        
        return String(runShared().last!)
    }

    public func part2() -> String? {
        let shared = runShared()
        let count = shared.count
        
        guard count >= 3 else {
            return nil
        }
        
        return String(shared[count - 1] + shared[count - 2] + shared[count - 3])
    }
}
