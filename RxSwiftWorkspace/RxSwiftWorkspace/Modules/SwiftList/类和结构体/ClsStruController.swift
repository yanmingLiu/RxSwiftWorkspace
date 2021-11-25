//
//  ClsStruController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class ClsStruController: BaseViewController {
    var scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.frame = view.bounds

        scrollView.frame.origin.y += navigationController?.navigationBar.bounds.size.height ?? 64
        view.addSubview(scrollView)

        let img = UIImage(named: "clsStru.png")
        let imgv = UIImageView(image: img)
        scrollView.addSubview(imgv)

        scrollView.contentSize = imgv.bounds.size
    }
}
