//
//  DeviceListViewModel.swift
//  MySideProject
//
//  Created by zuri cohen on 2/27/20.
//  Copyright © 2020 zuri cohen. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa

struct DeviceListViewModel {
    let devicesVM: [DeviceViewModel]
}

extension DeviceListViewModel {
    
    init(_ devices: [Device]) {
        self.devicesVM = devices.compactMap(DeviceViewModel.init)
    }
    
}

extension DeviceListViewModel {
    
    func deviceAt(_ index: Int) -> DeviceViewModel {
        return self.devicesVM[index]
    }
}

struct DeviceViewModel {
    
    let device: Device
    
    init(_ device: Device) {
        self.device = device
    }
    
}

extension DeviceViewModel {
    
    var name: Observable<String> {
        return Observable<String>.just(device.name)
    }
    
    var isConnected: Observable<Bool> {
        return Observable<Bool>.just(device.isConnected ?? false)
    }
    
}
