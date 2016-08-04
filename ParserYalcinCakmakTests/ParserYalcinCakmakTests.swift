//
//  ParserYalcinCakmakTests.swift
//  ParserYalcinCakmakTests
//
//  Created by YC on 8/2/16.
//  Copyright © 2016 University of California at Santa Cruz. All rights reserved.
//

import XCTest
@testable import ParserYalcinCakmak

class ParserYalcinCakmakTests: XCTestCase {
    
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        vc = storyboard.instantiateInitialViewController() as! ViewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTotalNumberOfWords(){
       
        vc.viewDidLoad()
        let countedWords = vc.sortedWords
        let numberOfWords = 1716
        
        var total = 0
        var i = 0
        
        while i < countedWords.count {
            
            total += countedWords[i].1
            i += 1
        }
        
        XCTAssert(numberOfWords == total)
    }
    
    func testNumberOfEntries(){
        
        vc.viewDidLoad()
        let countedWords = vc.sortedWords
        let numberOfEntries = 664
        
        XCTAssert(numberOfEntries == countedWords.count)
    }
    
    func testCountUnicode(){
        
        vc.viewDidLoad()
        let countedWords = vc.sortedWords
        let numberOfUnicode = 41
        
        var count = 0
        var result = 0
        
        while count < countedWords.count {
            
            if  countedWords[count].0 == "Unicode" {
                result = countedWords[count].1
            }
            count += 1
        }
    
        XCTAssert(numberOfUnicode == result)
    }
    
    func testCountStandard(){
        
        vc.viewDidLoad()
        let countedWords = vc.sortedWords
        let numberOfStandard = 28
        
        var count = 0
        var result = 0
        
        while count < countedWords.count {
            
            if  countedWords[count].0 == "Standard" {
                result = countedWords[count].1
            }
            count += 1
        }
        
        XCTAssert(numberOfStandard == result)
    }
    
    func testCountEncoding(){
        
        vc.viewDidLoad()
        let countedWords = vc.sortedWords
        let numberOfEncoding = 15
        
        var count = 0
        var result = 0
        
        while count < countedWords.count {
            
            if  countedWords[count].0 == "encoding" {
                result = countedWords[count].1
            }
            count += 1
        }
        
        XCTAssert(numberOfEncoding == result)
    }
    func testFirstWord(){
        
        vc.viewDidLoad()
        let countedWords = vc.sortedWords
        
        var result = false
        
        if countedWords[0].0 == "the" {
            
            result = true
        }
        
        XCTAssert(result)
    }
    func testSecondWord(){
        
        vc.viewDidLoad()
        let countedWords = vc.sortedWords
        
        var result = false
        
        if countedWords[1].0 == "and" {
            
            result = true
        }
        
        XCTAssert(result)
    }
    func testSampleFailTest(){
        
        XCTAssert(false)
    }
}

