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
    
    init?(fileName: String, fileExt: String){
        
        let bundle = NSBundle.mainBundle()
        
        let filePath = bundle.pathForResource(fileName, ofType: fileExt)
        
        if let path = filePath {
            
            fileHandle = NSFileHandle(forReadingAtPath: path)
        } else {
            print("Error: could not find '\(fileName).\(fileExt)'")
            fileHandle = nil
        }
        if fileHandle == nil {
            return nil
        }
    }
    func parseFile() -> FileData? {
    
            let fileData = fileHandle.readDataToEndOfFile()
            
            let dataString = String( data: fileData, encoding: 4)
            
        if dataString != nil {
            
            let words = parseString(dataString!)
            
            return FileData(orderedWords: words)
        } else {
            return nil
        }
        
    }
    
    func parseString(source: String) -> [String] {
        
        var currentIndex = source.startIndex
        
        let lastIndex = source.endIndex
        
        var wordStart: String.Index? = nil
        
        var words = [String]()
        
        while (currentIndex < lastIndex){
            
            if !isWordBreak(source[currentIndex]) {
                
                if wordStart == nil {
                    
                    wordStart = currentIndex
                }
       
                } else {
                   
                    if wordStart != nil {
                        
                       let wordEnd = currentIndex.advancedBy(-1)
                        words.append(source[wordStart!...wordEnd])
                        
                        wordStart = nil
                    }
                }
            
            currentIndex = currentIndex.advancedBy(1)
        }
            if (wordStart != nil){
                
                words.append(source[wordStart!...lastIndex.advancedBy(-1)])
                
            }
            return words
    }
    
 
    func isWordBreak(char: Character) -> Bool {
        
        switch char {
        case " ", ".", ":",",","\n","(",")","-",";","“","”":
            return true
        default:
            return false
        }
    }
    

}








