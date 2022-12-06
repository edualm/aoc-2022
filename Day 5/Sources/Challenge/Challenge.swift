//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

typealias Instruction = (count: Int, source: Int, destination: Int)

func createInstruction(_ array: [String.SubSequence]) -> Instruction {
    return (Int(String(array[0]))!, Int(String(array[1]))!, Int(String(array[2]))!)
}

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 5
    
    let input: [String]
    
    var blankPiles: [[Character]] {
        var piles: [[Character]] = []
        
        for line in input {
            guard line != "" else {
                break
            }
            
            piles.append([])
        }
        
        return piles
    }
    
    var piles: [[Character]] {
        var piles = blankPiles
        
        input.dropLast(input.count - (piles.count - 1)).forEach {
            var i = 1
            var pile = 0
            
            while i < $0.count {
                if $0[i] != " " {
                    piles[pile].append($0[i])
                }
                
                i += 4
                pile += 1
            }
        }
        
        return piles.map { $0.reversed() }
    }
    
    var instructions: [Instruction] {
        input
            .dropFirst(blankPiles.count + 1)
            .map {
                let split = $0.split(separator: " ")
                
                return createInstruction([split[1], split[3], split[5]])
            }
    }
    
    public init(input: [[String]]) {
        self.input = input.first!
    }
    
    public func part1() -> String? {
        var localPiles = piles
        
        for instruction in instructions {
            for _ in 0 ..< instruction.count {
                localPiles[instruction.destination - 1].append(localPiles[instruction.source - 1].popLast()!)
            }
        }
        
        return localPiles.compactMap(\.last).reduce("") { c1, c2 in "\(c1!)\(c2)" }
    }

    public func part2() -> String? {
        var localPiles = piles
        
        for instruction in instructions {
            localPiles[instruction.destination - 1].append(contentsOf: localPiles[instruction.source - 1].suffix(instruction.count))
            localPiles[instruction.source - 1] = localPiles[instruction.source - 1].dropLast(instruction.count)
        }
        
        return localPiles.compactMap(\.last).reduce("") { c1, c2 in "\(c1!)\(c2)" }
    }
}
