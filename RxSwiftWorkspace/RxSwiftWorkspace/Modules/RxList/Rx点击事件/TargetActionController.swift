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

        btn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.left.equalTo(50)
            make.top.equalTo(100)
        }

        btn.rx.tap
            .subscribe({ (event) in
                DLog(btn.currentTitle)
            })
            .disposed(by: disposeBag)


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
