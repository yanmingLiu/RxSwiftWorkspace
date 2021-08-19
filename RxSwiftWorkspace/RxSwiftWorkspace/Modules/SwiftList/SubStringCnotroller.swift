//
//  SubStringCnotroller.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2021/8/19.
//  Copyright © 2021 lym. All rights reserved.
//

import UIKit

class SubStringCnotroller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let str = "这里演示😺通😊过'下标'截取字🇨🇺符串的☠️操作, this is good func ,please look look."

        let label = UILabel(frame: CGRect(x: 20, y: 160, width: view.bounds.width - 40, height: 60))
        label.numberOfLines = 0
        label.text = str
        view.addSubview(label)

        let label2 = UILabel(frame: CGRect(x: 20, y: label.frame.maxY + 20, width: view.bounds.width - 40, height: 60))
        label2.text = "subscript (n:5) -> String : " + str[5]
        view.addSubview(label2)

        let label3 = UILabel(frame: CGRect(x: 20, y: label2.frame.maxY + 20, width: view.bounds.width - 40, height: 90))
        label3.text = "subscript [1...] : " + str[1...]
        label3.numberOfLines = 0
        view.addSubview(label3)

        let label4 = UILabel(frame: CGRect(x: 20, y: label3.frame.maxY + 20, width: view.bounds.width - 40, height: 60))
        label4.text = "subscript [0...5] : " + str[0 ... 5]
        view.addSubview(label4)

        let label5 = UILabel(frame: CGRect(x: 20, y: label4.frame.maxY + 20, width: view.bounds.width - 40, height: 60))
        label5.text = "subscript [...5] : " + str[...5]
        view.addSubview(label5)

        let label6 = UILabel(frame: CGRect(x: 20, y: label5.frame.maxY + 20, width: view.bounds.width - 40, height: 60))
        label6.text = "subscript [0..<10] : " + str[0 ..< 10]
        view.addSubview(label6)
    }
}
