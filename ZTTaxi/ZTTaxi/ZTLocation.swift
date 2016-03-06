//
//  ZTLocation.swift
//  ZTTaxi
//
//  Created by zt on 16/3/7.
//  Copyright © 2016年 zt. All rights reserved.
//

import UIKit

import CoreLocation

class ZTLocation: NSObject, CLLocationManagerDelegate {
    var manager:CLLocationManager?
    
    func startLocation()
    {
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            
            manager?.delegate = self
            manager?.desiredAccuracy = kCLLocationAccuracyBest
            manager?.distanceFilter = 100
            
            manager?.startUpdatingLocation()
            manager?.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        ZTLog(String(status))
    }
    
    func searchAddress(location:CLLocation)
    {
        let corder = CLGeocoder()
        
        corder.reverseGeocodeLocation(location, completionHandler: {
            (marks:[CLPlacemark]?, error:NSError?) in
            
            if marks != nil {
                for mark in marks! {
                    ZTLog(mark.name!)
                }
            }
        })
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation)
    {
        searchAddress(newLocation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        searchAddress(locations[0])
        
        //停止更新位置（如果定位服务不需要实时更新的话，那么应该停止位置的更新）
        manager.stopUpdatingLocation()
    }
}
