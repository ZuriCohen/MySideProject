//
//  PopupViewController.swift
//  MySideProject
//
//  Created by zuri cohen on 3/6/20.
//  Copyright © 2020 zuri cohen. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.popupView.layer.cornerRadius = 10
    }
    

    @IBAction func didTapCancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
