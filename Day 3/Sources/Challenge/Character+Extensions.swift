//
//  Character+Extensions.swift
//  Challenge
//

import Foundation

public extension Character {
    
    var priority: Int {
        
        let scalarValue = Int(Unicode.Scalar("\(self)")!.value)
        
        if scalarValue >= 97 {
            return scalarValue - 96
        }
        
        return scalarValue - 64 + 26
    }
}
