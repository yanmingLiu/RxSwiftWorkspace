//
//  KVOController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class KVOController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.backgroundColor = UIColor.random
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        view.addSubview(scrollView)

        scrollView.rx.contentOffset
            .subscribe({ (contentOffset) in
                print("contentOffset: \(contentOffset)")
            })
            .disposed(by: rx.disposeBag)
    }

    
}
