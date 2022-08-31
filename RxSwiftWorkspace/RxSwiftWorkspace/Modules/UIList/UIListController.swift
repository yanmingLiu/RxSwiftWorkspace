//
//  UIListController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/3.
//  Copyright © 2019 lym. All rights reserved.
//

import MJRefresh
import UIKit

class UIListController: UITableViewController {
    let list = ["MineViewController",
                "ImageViewController",
                "UICollectionViewMove",
                "MassiveViewController",
                "MVCController",
                "TitleTagViewController",
                "LocalizableController",
                "IconFontController"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")

        let header = MJRefreshNormalHeader { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.tableView.mj_header?.endRefreshing()
            }
        }
        header.isAutomaticallyChangeAlpha = true
        tableView.mj_header = header

        dlog(UIWindow.statusBarHeight)
        dlog(navigationController!.navigationBar.frame.height)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = list[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let vcStr = list[indexPath.row]
        guard let vc = vcStr.toViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
