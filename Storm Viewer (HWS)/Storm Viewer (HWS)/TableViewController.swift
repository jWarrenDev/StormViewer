//
//  ViewController.swift
//  Storm Viewer (HWS)
//
//  Created by Jerrick Warren on 7/18/19.
//  Copyright © 2019 Jerrick Warren. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // iterate through all of the items
        // look for the prefix
        
        for item in items {
            if item.hasPrefix("nssl"){
                // add the item to the pictures array
                pictures.append(item)
            }
        }
        print(pictures)
    }
}

