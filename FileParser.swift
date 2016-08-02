//
//  FileParser.swift
//  ParserYalcinCakmak
//
//  Created by YC on 8/2/16.
//  Copyright © 2016 University of California at Santa Cruz. All rights reserved.
//

import Foundation

class FileParser {
    
    private let fileHandle: NSFileHandle!
    
    init(fileName: String, fileExt: String){
        
        let bundle = NSBundle.mainBundle()
        
        let filePath = bundle.pathForResource(fileName, ofType: fileExt)
        
        if let path = filePath {
            
            fileHandle = NSFileHandle(forReadingAtPath: path)
        } else {
            print("Error: could not find '\(fileName).\(fileExt)'")
            fileHandle = nil
        }
    }
    func parseFile(){
    
        if let fHandle = fileHandle {
            
            let fileData = fHandle.readDataToEndOfFile()
            
            let dataString = String( data: fileData, encoding: 4)
            
            print("Here's the file: \(dataString)")
            
        }
    }
}