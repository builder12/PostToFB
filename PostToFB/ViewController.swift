//
//  ViewController.swift
//  PostToFB
//
//  Created by Sprinthub on 07/02/2019.
//  Copyright © 2019 Sprinthub Mobile. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    //initialize picture names as array
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //get instance of file manager
        let fm = FileManager.default
        
        //get resource path (Content folder)
        let path = Bundle.main.resourcePath!
        
        //get all items in resource path
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        //loop through images from path
        for item in items {
            
            //check if filename starts with "nss1" this is to ensure not all images are loaded
            if item.hasPrefix("nssl") {
                
                // this is a picture to load!
                pictures.append(item)
            }
        }
        
        //show large title
        navigationController?.navigationBar.prefersLargeTitles = true

        //print(pictures)
    }
    
    
    //finallu understood why these guys are named the same. LOL
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

