//
//  Challenge.swift
//  Challenge
//

import Foundation
import Utilities

public struct Challenge: RunnableChallenge {
    
    public let day: Int = 7
    
    let input: [String]
    
    let filesystem = Folder(name: "/", parent: nil)
    let allFolders: [Folder]
    
    public init(input: [[String]]) {
        self.input = input.first!
        
        var currentFolder = filesystem
        var allFoldersPartial: [Folder] = []
        
        var parsed: [[String]] = []
        
        for line in self.input {
            if line.hasPrefix("$") {
                parsed.append([line])
            } else {
                parsed[parsed.count - 1].append(line)
            }
        }
        
        parsed.dropFirst(1).forEach {
            let userCommand = $0.first!
            
            if userCommand.hasPrefix("$ cd") {
                let targetDir = userCommand.dropFirst(5)
                
                if targetDir == ".." {
                    currentFolder = currentFolder.parent!
                } else {
                    currentFolder.folders.forEach {
                        if $0.name == targetDir {
                            currentFolder = $0
                        }
                    }
                }
            } else if userCommand.hasPrefix("$ ls") {
                $0.dropFirst(1).forEach {
                    if $0.hasPrefix("dir") {
                        let newFolder = Folder(name: String($0.dropFirst(4)), parent: currentFolder)
                        
                        currentFolder.folders.append(newFolder)
                        allFoldersPartial.append(newFolder)
                    } else {
                        let spl = $0.split(separator: " ")
                        
                        let name = String(spl.last!)
                        let size = Int(spl.first!)!
                        
                        currentFolder.files.append(File(parent: currentFolder, name: name, size: size))
                    }
                }
            } else {
                fatalError("Unsupported command: \(userCommand)")
            }
        }
        
        allFolders = allFoldersPartial
    }
    
    public func part1() -> String? {
        let result = allFolders.reduce(into: 0) { accum, current in
            if current.size <= 100_000 {
                accum += current.size
            }
        }
        
        return "\(result)"
    }

    public func part2() -> String? {
        let requiredSize = 30_000_000 - (70_000_000 - filesystem.size)
        
        var result = Int.max
        
        allFolders.forEach {
            if $0.size < result && $0.size > requiredSize {
                result = $0.size
            }
        }
        
        return "\(result)"
    }
}
