//
//  FileData.swift
//  ParserYalcinCakmak
//
//  Created by YC on 8/3/16.
//  Copyright © 2016 University of California at Santa Cruz. All rights reserved.
//

import Foundation

class FileData {
    
    let orderedWords: [String]
    
    var countedWords: [String : Int]!
    
    init(orderedWords: [String]) {
        
        self.orderedWords = orderedWords
    }
    
    func countWords() {
        var wordDict = [String : Int]()
        
        for eachWord in orderedWords {
            let currentCount = wordDict[eachWord]
            if currentCount == nil {
                wordDict[eachWord] = 1
            } else {
                wordDict[eachWord] = currentCount! + 1
            }
            
        }
        countedWords = wordDict
    }
    
}
