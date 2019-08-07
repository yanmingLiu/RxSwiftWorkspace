//
//  BlockController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class BlockController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 普通方式
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "www.baidu.com")!)) { (data, response, error) in

            guard error == nil else {
                print("Data Task Error: \(error!)")
                return
            }

            guard let data = data else {
                print("Data Task Error: unknown")
                return
            }

            print("Data Task Success with count: \(data.count)")
            }.resume()

        // rx
        URLSession.shared.rx
            .data(request: URLRequest(url: URL(string: "www.baidu.com")!))
            .subscribe(onNext: { (data) in
                print("Data Task Success with count: \(data.count)")
            }, onError: { (error) in
                print("Data Task Error: \(error)")
            }, onCompleted: {

            }, onDisposed: {

            })
            .disposed(by: rx.disposeBag)


        text.text = """

        URLSession.shared.rx
        .data(request: URLRequest(url: URL(string: "www.baidu.com")!))
        .subscribe(onNext: { (data) in

        }, onError: { (error) in

        }, onCompleted: {

        }, onDisposed: {

        })
        .disposed(by: disposeBag)
        """

    }

}
