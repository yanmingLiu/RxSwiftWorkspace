//
//  UIListController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/3.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class UIListController: UITableViewController {
    let list = ["MineViewController",
                "ImageViewController",
                "UICollectionViewMove",
                "MassiveViewController",
                "MVCController",
                "TitleTagViewController"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcStr = list[indexPath.row]
        guard let vc = vcStr.toViewController() else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
