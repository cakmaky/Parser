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
    func wordsOrderedByCount() -> [(String, Int)]{
        if countedWords == nil {
            countWords()
            
        }
        var wordCounts = [(String, Int)]()
        
        for (eachKey, eachValue) in countedWords {
            wordCounts.append(eachKey, eachValue)
        }
        wordCounts.sortInPlace(orderByCount)
        
        return wordCounts
    }
}

func orderByCount (lhs:(String, Int), rhs:(String, Int)) -> Bool {
    if lhs.1 > rhs.1 {
        return true
    } else {
        return false
    }
}
