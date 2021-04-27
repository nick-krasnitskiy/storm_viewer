//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Nick Krasnitskiy on 26.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var pictutes = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default //
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictutes.append(item)
            }
        }
        
    }


}

