//
//  CocTableViewCell.swift
//  iScout
//
//  Created by David Mercado on 3/18/19.
//  Copyright © 2019 CDT. All rights reserved.
//

import Foundation
import UIKit

class CocTableViewCell : UITableViewCell{

    @IBOutlet weak var labelLat: UILabel!
    @IBOutlet weak var labelLong: UILabel!
    @IBOutlet weak var buttonSetGPS: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
