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
        //wordCounts.sortInPlace(orderByAlphabetical)   // We have 3 different sort method and we can choose one of them
        //wordCounts.sortInPlace(orderByLCT)
        
        return wordCounts
    }
}

/*func orderByCount (lhs:(String, Int), rhs:(String, Int)) -> Bool { // this is the old orderByCount function
    if lhs.1 > rhs.1 {
        return true
    } else {
        return false
    } */

func orderByCount (lhs:(String, Int), rhs:(String, Int)) -> Bool {
    if lhs.1 > rhs.1 {
        return true
    }
    else if ((lhs.1 == rhs.1) && (lhs.0 < rhs.0)){
        return true // if two words has the same word count, we are sorting them lexicographically.
    }
    else {
        return false
    }
}
func orderByAlphabetical (lhs:(String, Int), rhs:(String, Int)) -> Bool { // This function sorts the word-count tuples lexicographically
    
    if lhs.0 < rhs.0 {
        return true
    
    } else {
      return false
    
    }
}
func orderByLCT (lhs:(String, Int), rhs:(String, Int)) -> Bool { // This function sorts the word-count tuples for using word length as a  
                                                    //primary sort, with word count as the secondary sort and word text as the third sort.

    if lhs.0.characters.count > rhs.0.characters.count {
        return true
    }
    else if (lhs.0.characters.count == rhs.0.characters.count) && (lhs.1 > rhs.1) {
        return true
    }
    else if (lhs.0.characters.count == rhs.0.characters.count) && (lhs.1 == rhs.1) && (lhs.0 < rhs.0) {
        return true
    }
    else {
        return false
    }
}
    
    

