//
//  AppDelegate.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/3.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import UIKit

import SSCustomTabbar
import TangramKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        TGDimeAdapter.template(CGSize(width: 360, height: 534))

        uuid()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let vc = YMTabBarController()
        vc.setupChilds()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

    func uuid() {
        let uuid1 = UIDevice.current.identifierForVendor?.uuidString ?? ""
        dlog("uuid1 = \(uuid1)")
    }
}
