//
//  HKBHomeTableViewCell.swift
//  HomeKitBrowser
//
//  Created by Jack Cox on 1/30/15.
//  Copyright (c) 2015 CapTech Consulting. All rights reserved.
//

import UIKit
import HomeKit

class HKBHomeTableViewCell: UITableViewCell {
    
    var home:HMHome!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
