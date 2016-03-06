//
//  AppDelegate.swift
//  ZTTaxi
//
//  Created by zt on 16/3/5.
//  Copyright © 2016年 zt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        if isiPhone5(){
            ZTLog("startup:iphone5")
        }
        
        showGuidePage()
        return true
    }
    
    func showGuidePage() {
    
        let page = ZTGuidePage()
        
        self.window?.rootViewController = page
        self.window?.makeKeyAndVisible()
    
    }

    func applicationWillResignActive(application: UIApplication) {
       
    }

    func applicationDidEnterBackground(application: UIApplication) {
            }

    func applicationWillEnterForeground(application: UIApplication) {
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
     
    }

    func applicationWillTerminate(application: UIApplication) {
       
    }


}

