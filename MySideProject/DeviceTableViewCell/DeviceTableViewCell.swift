//
//  DeviceTableViewCell.swift
//  MySideProject
//
//  Created by zuri cohen on 3/2/20.
//  Copyright © 2020 zuri cohen. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnConnect: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
