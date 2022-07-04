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
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

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

        #if DEBUG
        dlog("DEBUG")
        #endif

        #if RELEASE
        dlog("RELEASE")
        #endif

        #if APPSTORE
        dlog("APPSTORE")
        #endif
    }
}
