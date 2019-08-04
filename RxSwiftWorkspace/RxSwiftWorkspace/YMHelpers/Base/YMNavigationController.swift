//
//  YMNavigationController.swift
//  swift5_wb
//
//  Created by lym on 2019/4/1.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class YMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bar = UINavigationBar.appearance()
        bar.barTintColor = UIColor.white
        bar.shadowImage = UIImage()

        // prefersLargeTitles
        bar.prefersLargeTitles = true
        var dict = [NSAttributedString.Key : Any]()
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        dict[.paragraphStyle] = style
        dict[.foregroundColor] = UIColor.random
        bar.largeTitleTextAttributes = dict


        //1.获取系统的Pop手势
        guard let systemGes = interactivePopGestureRecognizer else { return }

        //2.获取手势添加到的View中
        guard  let gesView = systemGes.view else { return }

        //3.获取target／action
        //3.1利用运行时机制查看所有的属性名称
//        var count : UInt32 = 0
//        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//        for i in 0..<count {
//            let ivar = ivars[Int(i)]
//            let name = ivar_getName(ivar)
//            print(String(cString: name!))
//        }
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }

        //取出target
        guard let target = targetObjc.value(forKey: "target") else { return }

        //取出action
        //  guard let action = targetObjc.value(forKey: "action") as? Selector else { return }
        let action = Selector(("handleNavigationTransition:"))


        // 创建自己的pan手势
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        
            let leftBarBtn = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(back))
            leftBarBtn.image = UIImage(named: "return")?.withRenderingMode(.alwaysOriginal)
            leftBarBtn.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -100, vertical: 0), for: .default)
            viewController.navigationItem.leftBarButtonItems = [leftBarBtn]
            viewController.navigationController?.navigationBar.prefersLargeTitles = false;
          }
        DLog(viewController)
        super.pushViewController(viewController, animated: animated)
    }


    @objc func back() {
        self.popViewController(animated: true)
    }
}

extension YMNavigationController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {

        return viewControllers.count == 1 ? false : true
    }
}


