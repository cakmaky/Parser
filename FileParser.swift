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
        
        let lastIndex = source.endIndex.advancedBy(-1)
        
        var wordStart: String.Index? = nil
        
        var words = [String]()
        
        while (currentIndex < lastIndex){
            
            if !isWordBreak(source[currentIndex], char2: source[currentIndex.advancedBy(1)]) {
                // We are sending two parameters to isWordBreak() function to improve the parser for creative exercise 1
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
                
                words.append(source[wordStart!...lastIndex])
                
            }
            return words
    }
    
 
    
    func isWordBreak(char1: Character, char2: Character) -> Bool {
        // This is my new isWordBreak() function for creative exercise 1
        if ((char1 == "." || char1 == "," || char1 == ":") && (char2 == " " || char2 == "\n")){
            return true
        }
        else if (char1 == " " || char1 == "\n" || char1 == "(" || char1 == ")" || char1 == "-" || char1 == ";" || char1 == "“" || char1 == "”"){
            return true
        }
        else {
            return false
        }
    }
    

}









