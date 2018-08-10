//
//  AppDelegate.swift
//  Classroom
//
//  Created by PAMacBook on 10.08.18.
//  Copyright © 2018 Zigzag. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainRoot = UINavigationController(rootViewController: MainVC())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = mainRoot
        
        return true
    }
}

