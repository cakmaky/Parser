//
//  ViewController.swift
//  ParserYalcinCakmak
//
//  Created by YC on 8/2/16.
//  Copyright © 2016 University of California at Santa Cruz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var sortedWords: [(String, Int)]! = nil
    
    var sortedWords2: [(String, Int)]! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let parser = FileParser(fileName: "U70-Intro-Plain", fileExt: "txt"){
            if let fileData = parser.parseFile() {
                
                fileData.countWords()
                
                sortedWords = fileData.wordsOrderedByCount()
               print("This is the words and counts of the first file. \n")
               print("\(sortedWords)")
            }
        }
        
       // print("New file is starting\n")
        if let parser2 = FileParser(fileName: "The Unicode Standard", fileExt: "txt"){
            if let fileData2 = parser2.parseFile() {
                
                fileData2.countWords()
                
                sortedWords2 = fileData2.wordsOrderedByCount()
                print("\n\nThis is the words and counts of the second file. \n")
                print("\(sortedWords2)")
            }
        }
        print("\n\nLet's compare two documents.")
        print("Top 50 words for both files are: \n")
        
        var count = 0
        var i = 0
        var j = 0
        while count < 50 {
            
            if (sortedWords[i].1 > sortedWords2[j].1) {
                print("\(count + 1) - \(sortedWords[i].0) \t appears \(sortedWords[i].1) times in  first file")
                i += 1
            }
            else {
                print("\(count + 1) - \(sortedWords2[j].0) \t appears \(sortedWords2[j].1) times in  second file")
                j += 1
            }
            
            count += 1
        }
        print("\n\nTop 50 words in first file are: \n")
        
        count = 0
        
        while count < 50 {
            
            print("\(count + 1) - \(sortedWords[count].0) \t appears \(sortedWords[count].1) times in a file")
            count += 1
        }
        print("\n\nTop 50 words in second file are: \n")
        
        count = 0
        
        while count < 50 {
            
            print("\(count + 1) - \(sortedWords2[count].0) \t appears \(sortedWords2[count].1) times in a file")
            count += 1
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if sortedWords == nil {
            return 0
            
        } else {
            return sortedWords!.count
            
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("parserCell", forIndexPath: indexPath)
        let currentItem: (String, Int) = sortedWords[indexPath.row]
        let (word, wordCount) = currentItem
        
        cell.textLabel?.text = word
        cell.detailTextLabel?.text = "\(wordCount)"
        
        return cell
    }
    
}














