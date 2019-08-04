//
//  BaseViewController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    let text = UITextView()

    let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black


        text.frame = CGRect(x: 20, y: 0, width: view.bounds.width-40, height: view.bounds.height)
        text.textColor = UIColor.white
        text.backgroundColor = UIColor.black
        text.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(text)

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)


        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
}
