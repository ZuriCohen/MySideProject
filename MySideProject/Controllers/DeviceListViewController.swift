//
//  DeviceListViewController.swift
//  MySideProject
//
//  Created by zuri cohen on 2/26/20.
//  Copyright © 2020 zuri cohen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DeviceListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
    }
    
    func setupUI() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }

 
}

extension DeviceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        return cell
        
    }
  
}
