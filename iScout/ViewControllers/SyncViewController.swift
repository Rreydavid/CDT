//
//  SyncViewController.swift
//  iScout
//
//  Created by David Mercado on 3/18/19.
//  Copyright © 2019 CDT. All rights reserved.
//
// This portion would be used to sync up the bluetooth between app and Raspberry PI


import Foundation
import UIKit

class SyncViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseableCellBT", for: indexPath)
            as! SyncTableViewCell
        return cell
    }
    
}
