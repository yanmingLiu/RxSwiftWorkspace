//
//  SharedController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import SnapKit
import UIKit

class SharedDemo {
    static let shared = SharedDemo()
    var id = ""
    private init() {}
}

class SharedController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        SharedDemo.shared.id = "1"

        text.text = """


        class SharedDemo {
            static let shared = SharedDemo()
            var id = ""
            private init() {}
        }
        """
    }

    override func touchesBegan(_: Set<UITouch>, with _: UIEvent?) {
        SharedDemo.shared.id = (arc4random() % 5).description

        dlog(SharedDemo.shared.id)
    }
}
