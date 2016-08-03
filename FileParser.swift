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
    func parseFile(){
    
            let fileData = fileHandle.readDataToEndOfFile()
            
            let dataString = String( data: fileData, encoding: 4)
            
        if dataString != nil {
            
            parseString(dataString!)
        }
        
    }
    
    func parseString(source: String){
        
        var currentIndex = source.startIndex
        
        let lastIndex = source.endIndex
        
        var wordStart: String.Index? = nil
        
        while (currentIndex < lastIndex){
            
            if !isWordBreak(source[currentIndex]) {
                
                if wordStart == nil {
                    
                    wordStart = currentIndex
       
                } else {
                   
                    if wordStart != nil {
                        
                       let wordEnd = currentIndex.advancedBy(-1)
                        
                        print(source[wordStart!...wordEnd])
                        
                        wordStart = nil
                    }
                }
            
            currentIndex = currentIndex.advancedBy(1)
        }
            if (wordStart != nil){
                
                print(source[wordStart!...lastIndex.advancedBy(-1)])
            }
    }
    
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








