//
//  TargetActionController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit
class TargetActionController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton(type: .custom)
        btn.setTitle("按钮点击", for: .normal)
        btn.backgroundColor = UIColor.random
        view.addSubview(btn)

        btn.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.right.equalTo(-50)
            make.top.equalTo(100)
        }

        btn.rx.tap
            .subscribe { _ in
                dlog(btn.currentTitle)
            }
            .disposed(by: rx.disposeBag)

        text.text = """

        // 按钮点击
        btn.rx.tap
            .subscribe({ (event) in
                DLog(btn.currentTitle)
            })
            .disposed(by: rx.disposeBag)


        // 手势点击
        let tap = UITapGestureRecognizer()
        view.addGestureRecognizer(tap)

        tap.rx.event
            .asObservable()
            .subscribe(onNext: { (recognizer) in
                DLog("tap 点击")
            })
            .disposed(by: rx.disposeBag)

        """
    }
}
