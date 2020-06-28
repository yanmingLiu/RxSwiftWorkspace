//
//  YMTabBarController.swift
//  swift5_wb
//
//  Created by lym on 2019/4/1.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

import SSCustomTabbar
import ESTabBarController_swift

class YMTabBarController: ESTabBarController {
    
}

extension YMTabBarController {
    
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
                         title: dic["title"] as? String,
                         tag: dic["tag"] as? Int ?? 0)
                
                
            }
        } catch  {
            debugPrint("获取tabbar.json异常")
        }
    }
    
    private func addChild(vc: String?, icon: String?, title: String?, tag: Int = 0) {
        
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
        childVC.navigationItem.title = title
        
        if let image = icon {
            let nomalImage = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            let selectedImage = UIImage(named: image + "Selected")?.withRenderingMode(.alwaysOriginal)
            let item = ESTabBarItem(title: title, image: nomalImage, selectedImage: selectedImage, tag: tag)
            childVC.tabBarItem = item
            
            if let tabBarItem = childVC.tabBarItem as? ESTabBarItem {
                switch item.tag {
                case 0:
                    tabBarItem.badgeValue = "New"
                case 1:
                    tabBarItem.badgeValue = "99+"
                case 2:
                    tabBarItem.badgeValue = "1"
                default:
                    tabBarItem.badgeValue = nil
                }
            }
        }
        
        let nav = YMNavigationController(rootViewController: childVC)
        self.addChild(nav)
    }
    
}
