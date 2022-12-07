//
//  File.swift
//  Challenge
//

import Foundation

class File {
    
    let parent: Folder
    let name: String
    let size: Int
    
    init(parent: Folder, name: String, size: Int) {
        self.parent = parent
        self.name = name
        self.size = size
    }
}
