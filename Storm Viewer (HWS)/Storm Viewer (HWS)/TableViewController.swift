//
//  ViewController.swift
//  Storm Viewer (HWS)
//
//  Created by Jerrick Warren on 7/18/19.
//  Copyright © 2019 Jerrick Warren. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
        print(pictures.sorted())
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures.sorted()[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
           
            vc.selectedImage = pictures[indexPath.row] 
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}

