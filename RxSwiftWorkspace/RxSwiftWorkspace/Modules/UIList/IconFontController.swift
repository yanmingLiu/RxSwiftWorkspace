//
//  IconFontControllerTableViewController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2022/8/31.
//  Copyright © 2022 lym. All rights reserved.
//

import UIKit

class IconFontController: UITableViewController {
    private var datas = [UIImage]()
    private var datas2 = [NSAttributedString]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "IconFont图片和富文本显示"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")

        datas = [
            makeImage(.buhangIcon),
            makeImage(.jiacheIcon),
            makeImage(.gongjiaoIcon),
            makeImage(.dingweijiudianIcon),
            makeImage(.guanbiIcon),
            makeImage(.jianshaoIcon),
            makeImage(.dingweijiudianIcon),
            makeImage(.lianxijiudianIcon),
            makeImage(.qiehuanIcon),
            makeImage(.sousuoIcon),
            makeImage(.tongxunluIcon),
            makeImage(.xiangxiazhankaihuoxiangshangshouqiIcon),
            makeImage(.guanbiIcon),
            makeImage(.xinxiIcon),
            makeImage(.zuojiantouIcon),
            makeImage(.youjiantouIcon),
        ]

        datas2 = [
            makeText(.buhangIcon),
            makeText(.jiacheIcon),
            makeText(.gongjiaoIcon),
            makeText(.dingweijiudianIcon),
            makeText(.guanbiIcon),
            makeText(.jianshaoIcon),
            makeText(.dingweijiudianIcon),
            makeText(.lianxijiudianIcon),
            makeText(.qiehuanIcon),
            makeText(.sousuoIcon),
            makeText(.tongxunluIcon),
            makeText(.xiangxiazhankaihuoxiangshangshouqiIcon),
            makeText(.guanbiIcon),
            makeText(.xinxiIcon),
            makeText(.zuojiantouIcon),
            makeText(.youjiantouIcon),
        ]
        tableView.rowHeight = 90
        tableView.reloadData()
    }

    private func makeImage(_ code: IconCodeStr) -> UIImage {
        let size = CGSize(width: 20, height: 20)
        let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -24)
        return MWIconFont.image(fromIconStr: code.rawValue,
                                size: size,
                                color: .random,
                                edgeInsets: edgeInsets)!
    }

    private func makeText(_ code: IconCodeStr) -> NSAttributedString {
        return MWIconFont.attributedString(fromIconStr: code.rawValue,
                                           size: 40,
                                           color: .random)!
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return datas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.imageView?.image = datas[indexPath.row]
        cell.textLabel?.attributedText = datas2[indexPath.row]

        return cell
    }
}
