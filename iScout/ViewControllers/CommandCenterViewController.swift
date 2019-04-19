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
    
    //return number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseableCell", for: indexPath)
            as! CocTableViewCell
        
        //set text for label on each row for their respective layer
        if(indexPath.row == 0){
            cell.labelMain?.text = kCoc
        }
        else if(indexPath.row == 1){
            cell.labelMain?.text = kMedical
        }
        else if(indexPath.row == 2){
            cell.labelMain?.text = kChow
        }
        else if(indexPath.row == 3){
            cell.labelMain?.text = kSupplies
        }
        else if(indexPath.row == 4){
            cell.labelMain?.text = kBivouac
        }
        else if(indexPath.row == 5){
            cell.labelMain?.text = kMotorPool
        }
        else if(indexPath.row == 6){
            cell.labelMain?.text = kFuel
        }
        else if(indexPath.row == 7){
            cell.labelMain?.text = kWater
        }
        return cell
    }
    
}
