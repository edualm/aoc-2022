//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 8
    
    let grid: [[Int]]
    
    public init(input: [[String]]) {
        self.grid = input.first!.map {
            $0.map { Int(String($0))! }
        }
    }
    
    func visibleFromTop(coordinate: Coordinate) -> Bool {
        let value = grid[coordinate]
        
        for i in 0 ..< coordinate.y {
            if grid[Coordinate(x: coordinate.x, y: i)]! >= value! {
                return false
            }
        }
        
        return true
    }
    
    func visibleFromBottom(coordinate: Coordinate) -> Bool {
        let value = grid[coordinate]
        
        for i in coordinate.y + 1 ..< grid.count {
            if grid[Coordinate(x: coordinate.x, y: i)]! >= value! {
                return false
            }
        }
        
        return true
    }
    
    func visibleFromLeft(coordinate: Coordinate) -> Bool {
        let value = grid[coordinate]
        
        for i in 0 ..< coordinate.x {
            if grid[Coordinate(x: i, y: coordinate.y)]! >= value! {
                return false
            }
        }
        
        return true
    }
    
    func visibleFromRight(coordinate: Coordinate) -> Bool {
        let value = grid[coordinate]
        
        for i in coordinate.x + 1 ..< grid.count {
            if grid[Coordinate(x: i, y: coordinate.y)]! >= value! {
                return false
            }
        }
        
        return true
    }
    
    func visibleFromAllSides(coordinate: Coordinate) -> Bool {
        return visibleFromTop(coordinate: coordinate)
            || visibleFromLeft(coordinate: coordinate)
            || visibleFromRight(coordinate: coordinate)
            || visibleFromBottom(coordinate: coordinate)
    }
    
    func topScenicScore(coordinate: Coordinate) -> Int {
        let value = grid[coordinate]
        
        var val = 0
        
        if coordinate.y == 0 {
            return 0
        }
        
        for i in stride(from: coordinate.y - 1, through: 0, by: -1) {
            val += 1
            
            if grid[Coordinate(x: coordinate.x, y: i)]! >= value! {
                return val
            }
        }
        
        return val
    }
    
    func bottomScenicScore(coordinate: Coordinate) -> Int {
        let value = grid[coordinate]
        
        var val = 0
        
        if coordinate.y == grid.count - 1 {
            return 0
        }
        
        for i in stride(from: coordinate.y + 1, to: grid.count, by: 1) {
            val += 1
            
            if grid[Coordinate(x: coordinate.x, y: i)]! >= value! {
                return val
            }
        }
        
        return val
    }
    
    func leftScenicScore(coordinate: Coordinate) -> Int {
        let value = grid[coordinate]
        
        var val = 0
        
        if coordinate.x == 0 {
            return 0
        }
        
        for i in stride(from: coordinate.x - 1, through: 0, by: -1) {
            val += 1
            
            if grid[Coordinate(x: i, y: coordinate.y)]! >= value! {
                return val
            }
        }
        
        return val
    }
    
    func rightScenicScore(coordinate: Coordinate) -> Int {
        let value = grid[coordinate]
        
        var val = 0
        
        if coordinate.x == grid.count - 1 {
            return 0
        }
        
        for i in stride(from: coordinate.x + 1, to: grid.count, by: 1) {
            val += 1
            
            if grid[Coordinate(x: i, y: coordinate.y)]! >= value! {
                return val
            }
        }
        
        return val
    }
    
    func totalScenicScore(coordinate: Coordinate) -> Int {
        return topScenicScore(coordinate: coordinate)
            * leftScenicScore(coordinate: coordinate)
            * rightScenicScore(coordinate: coordinate)
            * bottomScenicScore(coordinate: coordinate)
    }
    
    public func part1() -> String? {
        var count = 0
        
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count {
                if visibleFromAllSides(coordinate: Coordinate(x: j, y: i)) {
                    count += 1
                }
            }
        }
        
        return "\(count)"
    }

    public func part2() -> String? {
        var topScore = 0
        
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count {
                let score = totalScenicScore(coordinate: Coordinate(x: j, y: i))
                
                if score > topScore {
                    topScore = score
                }
            }
        }
        
        return "\(topScore)"
    }
}
