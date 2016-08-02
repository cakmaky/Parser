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
        let parser = FileParser(fileName: "U70-Intro-Plain", fileExt: "txt")
        
        parser.parseFile()
    }
}

