//
//  AppDelegate.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/3.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white

        let vc = UITabBarController()
        vc.setupChilds()
        window?.rootViewController = vc

        window?.makeKeyAndVisible()

        return true
    }
    
}

