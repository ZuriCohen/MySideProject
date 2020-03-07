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
        
        
        self.devices.filter({$0.isConnected})
        
        switch section {
        case 0:
            return self.devices.filter({$0.isConnected}).count
        case 1:
            return self.devices.filter({!$0.isConnected}).count
        default: break
           break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let section = indexPath.section
        
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "DeviceTableViewCell", for: indexPath) as? DeviceTableViewCell else {
            fatalError("Cell is not found")
        }
        
        if section == 0 {
            let connectedDevices = self.devices.filter({$0.isConnected})
            cell.lblName.text = connectedDevices[indexPath.row].name
        } else {
            let disconnectedDevices = self.devices.filter({!$0.isConnected})
            cell.lblName.text = disconnectedDevices[indexPath.row].name
            
        }
        
        return cell
        
        
 
//        let deviceVM = self.deviceListVM.deviceAt(indexPath.row)
//        deviceVM.name.asDriver(onErrorJustReturn: "")
//            .drive(cell.lblName.rx.text)
//            .disposed(by: disposeBag)
 
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did tap cell")
        
        ////
        //show popup
        

        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PopupViewController") as? PopupViewController
        
        
        self.present(vc!, animated: true, completion: nil)
        
        
        
        
        
        ////
        
//        if devices[indexPath.row].isConnected {
//            devices[indexPath.row].isConnected = false
//        } else {
//            devices[indexPath.row].isConnected = true
//        }
        
        
        
        self.tableView.reloadData()
    }
}
