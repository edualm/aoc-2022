//
//  Outcome.swift
//  Challenge
//

import Foundation

enum Outcome {
    
    case defeat
    case draw
    case victory
    
    init?(from code: String) {
        switch code {
        case "X":
            self = .defeat
            
        case "Y":
            self = .draw
            
        case "Z":
            self = .victory
            
        default:
            return nil
        }
    }
    
    var points: Int {
        switch self {
        case .defeat:
            return 0
            
        case .draw:
            return 3
            
        case .victory:
            return 6
        }
    }
}
