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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let parser = FileParser(fileName: "U70-Intro-Plain", fileExt: "txt"){
            if let fileData = parser.parseFile() {
                
                fileData.countWords()
                
                sortedWords = fileData.wordsOrderedByCount()
                print("\(sortedWords)")
            }
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














