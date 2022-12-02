//
//  Shape.swift
//  Challenge
//

import Foundation

enum Shape {
    
    case rock
    case paper
    case scissors
    
    public init?(from code: String) {
        switch code {
        case "A", "X":
            self = .rock
            
        case "B", "Y":
            self = .paper
            
        case "C", "Z":
            self = .scissors
            
        default:
            return nil
        }
    }
    
    init?(fromOpponentShape opponentShape: Shape, desiredOutcome: Outcome) {
        switch (opponentShape, desiredOutcome) {
        case (.rock, .defeat):
            self = .scissors
            
        case (.rock, .draw):
            self = .rock
            
        case (.rock, .victory):
            self = .paper
            
        case (.paper, .defeat):
            self = .rock
            
        case (.paper, .draw):
            self = .paper
            
        case (.paper, .victory):
            self = .scissors
            
        case (.scissors, .defeat):
            self = .paper
            
        case (.scissors, .draw):
            self = .scissors
            
        case (.scissors, .victory):
            self = .rock
        }
    }
    
    var points: Int {
        switch self {
        case .rock:
            return 1
        
        case .paper:
            return 2
            
        case .scissors:
            return 3
        }
    }
}
