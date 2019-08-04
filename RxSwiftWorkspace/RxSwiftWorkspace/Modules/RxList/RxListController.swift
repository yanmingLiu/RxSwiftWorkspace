//
//  RxListController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/3.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class RxListController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        keys = ["Rx点击事件",
                "KVO监听",
                "闭包回调",
                "通知",


        ]
        vaules = ["TargetActionController",
                  "KVOController",
                  "BlockController",
                  "NotiController"

        ]


    }

}
