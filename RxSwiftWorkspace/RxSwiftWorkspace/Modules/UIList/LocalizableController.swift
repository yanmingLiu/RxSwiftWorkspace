//
//  LocalizableController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2022/7/25.
//  Copyright © 2022 lym. All rights reserved.
//

import Foundation
import UIKit

class LocalizableController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        text.removeFromSuperview()

        let str0 = String(format: NSLocalizedString("%d Gift(s)", comment: ""), 0)
        let str1 = String(format: NSLocalizedString("%d Gift(s)", comment: ""), 1)
        let str2 = String(format: NSLocalizedString("%d Gift(s)", comment: ""), 2)

        let texts = [str0, str1, str2]

        for (i, v) in texts.enumerated() {
            let label = UILabel()
            view.addSubview(label)
            label.text = v
            label.textColor = .white
            print(v)
            label.frame = CGRect(x: 20, y: 150 + (i * 40), width: Int(view.bounds.width) - 40, height: 40)
        }
    }
}
