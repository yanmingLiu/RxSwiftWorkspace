//
//  YMTabBarController.swift
//  swift5_wb
//
//  Created by lym on 2019/4/1.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit


extension UITabBarController {

    public func setupChilds() {

        guard let filePath = Bundle.main.path(forResource: "TabBar.json", ofType: nil) else {
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [[String: AnyObject]]

            for dic in json {
                addChild(vc: dic["vc"] as? String,
                         icon: dic["icon"] as? String,
                         title: dic["title"] as? String)
            }

        } catch  {
            debugPrint("获取tabbar.json异常")
        }
    }

    private func addChild(vc: String?, icon: String?, title: String?) {

        guard let vcName = vc else { return }

        // 1.获取命名空间
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return
        }
        // 2.获取Class
        let vcCls: AnyClass? = NSClassFromString(name + "." + vcName)
        guard let tyleCls = vcCls as? UIViewController.Type else {
            return
        }
        // 3.创建vc
        let childVC = tyleCls.init()
        childVC.title = title

        if let image = icon {
            childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            childVC.tabBarItem.selectedImage = UIImage(named: image + "Selected")?.withRenderingMode(.alwaysOriginal)
        }
        let nav = YMNavigationController(rootViewController: childVC)
        self.addChild(nav)
    }

}


