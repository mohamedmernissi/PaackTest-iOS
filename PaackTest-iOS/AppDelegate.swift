//
//  AppDelegate.swift
//  PaackTest-iOS
//
//  Created by mohamed mernissi on 1/20/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // BatteryMonitoringEnabled to get battery level
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        let navigationController = UINavigationController(rootViewController: DeliveriesListView())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

