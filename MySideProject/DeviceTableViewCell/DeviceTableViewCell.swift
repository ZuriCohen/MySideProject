//
//  DeviceTableViewCell.swift
//  MySideProject
//
//  Created by zuri cohen on 3/2/20.
//  Copyright © 2020 zuri cohen. All rights reserved.
//

import UIKit
import JGProgressHUD

class DeviceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnConnect: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        /*TODO: add progresshud to the project
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading"
        hud.show(in: self.btnConnect)
        hud.dismiss(afterDelay: 3.0)
        */

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
