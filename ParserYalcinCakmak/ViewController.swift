//
//  ViewController.swift
//  ParserYalcinCakmak
//
//  Created by YC on 8/2/16.
//  Copyright © 2016 University of California at Santa Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let parser = FileParser(fileName: "U70-Intro-Plain", fileExt: "txt"){
            if let fileData = parser.parseFile() {
                
                fileData.countWords()
                
                let sortedWords = fileData.wordsOrderedByCount()
                print("\(sortedWords)")
            }
        }
    }
}

