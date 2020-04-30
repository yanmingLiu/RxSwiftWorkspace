//
//  SharedController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit
import SnapKit

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
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        SharedDemo.shared.id = (arc4random() % 5).description

        dlog(SharedDemo.shared.id)
    }


}
