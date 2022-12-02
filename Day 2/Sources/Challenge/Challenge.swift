//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 2
    
    let input: [[String]]
    
    public init(input: [[String]]) {
        self.input = input
    }
    
    func outcome(opponent: Shape, you: Shape) -> Outcome {
        switch (opponent, you) {
        case (.paper, .rock), (.scissors, .paper), (.rock, .scissors):
            return .defeat
            
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            return .draw
            
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .victory
        }
    }
    
    public func part1() -> String? {
        let mapped = input.first!.map {
            $0
                .split(separator: " ")
                .map(String.init)
                .compactMap(Shape.init)
        }.map {
            let opponent = $0.first!
            let you = $0.last!
            
            return outcome(opponent: opponent, you: you).points + you.points
        }.reduce(0, +)
        
        return String(mapped)
    }

    public func part2() -> String? {
        let mapped = input.first!.map {
            $0
                .split(separator: " ")
                .map(String.init)
        }.map {
            let opponent = Shape(from: $0.first!)!
            
            let you = Shape(fromOpponentShape: opponent,
                            desiredOutcome: .init(from: $0.last!)!)!
            
            return outcome(opponent: opponent, you: you).points + you.points
        }.reduce(0, +)
        
        return String(mapped)
    }
}
