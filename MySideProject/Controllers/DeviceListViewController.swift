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
// TODO: add progresshud to the project
//import JGProgressHUD


class DeviceListViewController: UIViewController {
    
    var devices = [Device(name: "device_1", isConnected: false), Device(name: "device_2", isConnected: false),Device(name: "device_3", isConnected: true),Device(name: "device_4", isConnected: false), Device(name: "device_5", isConnected: true)]
    
    // MARK: - Parameters
    
    let disposeBag = DisposeBag()
    private var deviceListVM: DeviceListViewModel!
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
    }
    
    func setupUI() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNibs()
    }
    
    // MARK: - Register Nibs file
    
    func registerNibs() {
        self.tableView.register(UINib(nibName: "DeviceTableViewCell", bundle: nil), forCellReuseIdentifier: "DeviceTableViewCell")
    }
    
}

// MARK: - UITableViewDataSource

extension DeviceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "MY DEVICES"
        case 1:
            return "OTHER DEVICES"
        default: break
           break
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //let index = indexPath.row
        
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "DeviceTableViewCell", for: indexPath) as? DeviceTableViewCell else {
            fatalError("Cell is not found")
        }
        
        cell.lblName.text = self.devices[indexPath.row].name
        
        
        let section = indexPath.section
        
        if section == 0 {
            if devices[indexPath.row].isConnected {
                return cell
            }
        }
        
        if section == 1 {
            if !devices[indexPath.row].isConnected {
                return cell
            }
        }
        
        return UITableViewCell()
    
        //let deviceVM = self.deviceListVM.deviceAt(index)
        
//        deviceVM.name.asDriver(onErrorJustReturn: "")
//            .drive(cell.lblName.rx.text)
//            .disposed(by: disposeBag)
 
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did tap cell")
        devices[indexPath.row].isConnected = true
        self.tableView.reloadData()
    }
}
