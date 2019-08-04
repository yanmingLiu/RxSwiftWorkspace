//
//  Common.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {

    public func getvc(vc: String?, block: @escaping (_ vc : UIViewController?) -> Void)  {

        guard let vcName = vc else {
            return
        }

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

        block(childVC)
    }
}


