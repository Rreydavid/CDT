//
//  CommandCenterViewController.swift
//  iScout
//
//  Created by David Mercado on 3/18/19.
//  Copyright © 2019 CDT. All rights reserved.
//
// This portion will be used to set up location of Command Center, First Aid,
// Food, Water, Living Tents, etc...

import Foundation
import UIKit

class CommandCenterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableCell", for: indexPath)
            as! CocTableViewCell
        return cell
    }
}
