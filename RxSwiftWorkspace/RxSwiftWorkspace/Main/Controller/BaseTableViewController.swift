//
//  BaseTableViewController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2019/8/4.
//  Copyright © 2019 lym. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {


    var keys = [String]()
    var vaules = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = keys[indexPath.row]
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = vaules[indexPath.row]

        getvc(vc: vc) { (controller) in

            guard let vc = controller else {return}

            vc.title = self.keys[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }

}
