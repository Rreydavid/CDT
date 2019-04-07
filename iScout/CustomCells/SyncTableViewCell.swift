//
//  SyncTableViewCell.swift
//  iScout
//
//  Created by David Mercado on 4/7/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import Foundation
import UIKit

class SyncTableViewCell : UITableViewCell{

    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var pairButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
