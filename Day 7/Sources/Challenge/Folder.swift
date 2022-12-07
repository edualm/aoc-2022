//
//  Folder.swift
//  Challenge
//

import Foundation

class Folder {
    
    var name: String
    var parent: Folder?
    var files: [File]
    var folders: [Folder]
    
    var size: Int {
        let fileSizes = files.reduce(0, { accum, cur in accum + cur.size })
        let folderSizes = folders.reduce(0, { accum, cur in accum + cur.size })
        
        return fileSizes + folderSizes
    }
    
    init(name: String, parent: Folder?) {
        self.name = name
        self.parent = parent
        self.files = []
        self.folders = []
    }
}
