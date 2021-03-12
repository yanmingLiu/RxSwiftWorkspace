//
//  NotiController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class NotiController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tf = UITextField(frame: CGRect(x: 20, y: 100, width: 120, height: 35));
        tf.backgroundColor = UIColor.white
        tf.placeholder = "输入框"
        view.addSubview(tf)

        text.frame.origin.y = 145

        NotificationCenter.default.rx
            .notification(UIWindow.keyboardWillShowNotification)
            .subscribe(onNext: { (notification) in

                let info = notification.userInfo as! [String : Any]

                let rect = info[UIWindow.keyboardFrameEndUserInfoKey] as! CGRect
                let height = rect.size.height;

                let beginRect = info[UIWindow.keyboardFrameBeginUserInfoKey] as! CGRect
                let endRect = rect

                dlog("keyBordInfo.height = \(height)")
                // 第三方键盘回调三次问题，监听仅执行最后一次
                if(beginRect.size.height > 0 && (beginRect.origin.y - endRect.origin.y > 0)){

                    //do someing
                    dlog("------1-------\(beginRect)");
                    dlog("------2-------\(endRect)")
                }
            })
            .disposed(by: rx.disposeBag)


        text.text = """
        NotificationCenter.default.rx
        .notification(UIWindow.keyboardWillShowNotification)
        .subscribe(onNext: { (notification) in

        let info = notification.userInfo as! [String : Any]

        let rect = info[UIWindow.keyboardFrameEndUserInfoKey] as! CGRect
        let height = rect.size.height;

        let beginRect = info[UIWindow.keyboardFrameBeginUserInfoKey] as! CGRect
        let endRect = rect

        // 第三方键盘回调三次问题，监听仅执行最后一次
        if(beginRect.size.height > 0 && (beginRect.origin.y - endRect.origin.y > 0)){

        
        }
        })
        .disposed(by: disposeBag)
        """


    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}
