//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

enum Direction {
    
    case up
    case down
    case left
    case right
    
    case upRight
    case upLeft
    case downRight
    case downLeft
    
    init?(character: Substring) {
        switch character {
        case "U":
            self = .up
            
        case "D":
            self = .down
            
        case "L":
            self = .left
            
        case "R":
            self = .right
            
        default:
            return nil
        }
    }
}

extension Coordinate {
    
    func move(direction: Direction) -> Coordinate {
        switch direction {
        case .up:
            return .init(x: self.x, y: self.y + 1)
            
        case .down:
            return .init(x: self.x, y: self.y - 1)
            
        case .left:
            return .init(x: self.x - 1, y: self.y)
            
        case .right:
            return .init(x: self.x + 1, y: self.y)
            
        case .upRight:
            return .init(x: self.x + 1, y: self.y + 1)
            
        case .upLeft:
            return .init(x: self.x - 1, y: self.y + 1)
            
        case .downRight:
            return .init(x: self.x + 1, y: self.y - 1)
            
        case .downLeft:
            return .init(x: self.x - 1, y: self.y - 1)
        }
    }
    
    func isAdjacent(to: Coordinate) -> Bool {
        let possibilities = [
            Coordinate(x: self.x, y: self.y),
            Coordinate(x: self.x + 1, y: self.y),
            Coordinate(x: self.x - 1, y: self.y),
            Coordinate(x: self.x, y: self.y + 1),
            Coordinate(x: self.x, y: self.y - 1),
            Coordinate(x: self.x + 1, y: self.y + 1),
            Coordinate(x: self.x - 1, y: self.y - 1),
            Coordinate(x: self.x + 1, y: self.y - 1),
            Coordinate(x: self.x - 1, y: self.y + 1),
        ]
        
        for p in possibilities {
            if to == p {
                return true
            }
        }
        
        return false
    }
}

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 9
    
    let directions: [Direction]
    
    static func directions(from line: String) -> [Direction] {
        let spl = line.split(separator: " ")
        
        return [Direction](repeating: Direction(character: spl[0])!, count: Int(spl[1])!)
    }
    
    static func newPosition(head: Coordinate, tail: Coordinate) -> Coordinate {
        if head.isAdjacent(to: tail) {
            return tail
        }
        
        let cases: [Direction]
        
        if head.x == tail.x || head.y == tail.y {
            cases = [.up, .down, .left, .right]
        } else {
            cases = [.upLeft, .upRight, .downLeft, .downRight]
        }
        
        for d in cases {
            let newCoordinate = tail.move(direction: d)
            
            if newCoordinate.isAdjacent(to: head) {
                print(d)
                return newCoordinate
            }
        }
        
        fatalError()
    }
    
    public init(input: [[String]]) {
        directions = input
            .first!
            .map(Challenge.directions)
            .reduce([], +)
    }
    
    public func part1() -> String? {
        var head = Coordinate(x: 0, y: 0)
        var tail = Coordinate(x: 0, y: 0)
        
        var allVisited = Set<Coordinate>([tail])
        
        directions.forEach {
            head = head.move(direction: $0)
            tail = Challenge.newPosition(head: head, tail: tail)
            
            allVisited.insert(tail)
        }
        
        return "\(allVisited.count)"
    }

    public func part2() -> String? {
        return nil
    }
}
