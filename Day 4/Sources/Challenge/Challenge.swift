//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    private typealias ElfRange = (Int,  Int)
    
    public let day: Int = 4
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    private func prepare(current: [String]) -> (ElfRange, ElfRange) {
        let result = current
            .map {
                $0
                    .split(separator: "-")
                    .map(String.init)
                    .compactMap(Int.init)
            }.map {
                ($0[0], $0[1])
            }
        
        return (result[0], result[1])
    }
    
    public func part1() -> String? {
        let result = input.reduce(into: 0) { result, current in
            let (firstElf, lastElf) = prepare(current: current)
            
            if (lastElf.0 >= firstElf.0 && lastElf.1 <= firstElf.1) ||
                (firstElf.0 >= lastElf.0 && firstElf.1 <= lastElf.1) {
                result += 1
            }
        }
        
        return "\(result)"
    }

    public func part2() -> String? {
        let result = input.reduce(into: 0) { result, current in
            let (firstElf, lastElf) = prepare(current: current)
            
            if !(
                (firstElf.0 < lastElf.0 && firstElf.1 < lastElf.0) ||
                (lastElf.0 < firstElf.0 && lastElf.1 < firstElf.0)
            ) && (
                (firstElf.1 >= lastElf.0) ||
                (lastElf.0 >= firstElf.1) ||
                (firstElf.0 <= lastElf.0 && firstElf.1 >= lastElf.1) ||
                (firstElf.0 >= lastElf.0 && firstElf.1 <= lastElf.1)
            ) {
                result += 1
            }
        }
        
        return "\(result)"
    }
}
