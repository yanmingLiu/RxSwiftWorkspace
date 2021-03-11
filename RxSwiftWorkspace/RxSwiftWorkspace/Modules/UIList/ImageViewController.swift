//
//  ImageViewController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2021/2/25.
//  Copyright © 2021 lym. All rights reserved.
//

import UIKit

class ImageViewController: BaseViewController {
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage(named: "img_bubble_right")!
        let resizeW = img.size.width * 0.5
        let resizeH = img.size.height * 0.5
        imageView.image = img.resizableImage(withCapInsets: UIEdgeInsets(top: resizeH, left: resizeW, bottom: resizeH, right: resizeW), resizingMode: .stretch)
        imageView.frame = CGRect(x: 0, y: 0, width: 240, height: 240)
        imageView.center = view.center
        view.addSubview(imageView)
    }
}
