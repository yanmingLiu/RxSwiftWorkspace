//
//  MVCController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2021/3/11.
//  Copyright © 2021 lym. All rights reserved.
//

import UIKit

struct TDoItem {
    let id: UUID
    let title: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
    }
}

/*
 简单来说，这也已经是对 MVC 的误用了。上面的代码存在着这些潜在问题：

 Model 层“寄生”在ViewController 中

 在这段代码中，View Controller 里的 items 充当了 model。

 这导致了几个问题：我们难以从外界维护或者同步 items 的状态，添加和删除操作被“绑定”在了这个 View Controller 里，
 如果你还想通过其他 View Controller 维护待办列表的话，
 就不得不考虑数据同步的问题 (我们会在稍后看到几个具体的这方面的例子)；
 另外，这样的设置导致 items 难以测试。你几乎无法为添加/删除/修改待办列表进行 Model 层的测试。

 违反数据流动规则和单一职责规则

 如果我们仔细思考，会发现，用户点击添加按钮，或者侧滑删除 cell 时，在 View Controller 中其实发生了这些事情：

 维护 Model (也就是 items)
 增删 table view 的 cell
 维护 addButton 的可用状态
 也就是说，UI 操作不仅导致了 Model 的变更，还同时导致了 UI 的变化。
 理想化的数据流动应该是单向的：UI 操作 -> 经由 View Controller 进行模型更新 -> 新的模型经由 View Controller 更新 UI -> 等待新的 UI 操作，
 而在例子中，我们变成了“经由 View Controller 进行模型更新以及 UI 操作”。虽然看起来这是很不起眼的变更，但是会在项目复杂后带来麻烦。
 
 */

private let cellIdentifier = "ToDoItemCell"


class MassiveViewController: UITableViewController {
    var items: [TDoItem] = []
    weak var addButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        addButton = navigationItem.rightBarButtonItem
    }

    @objc func addButtonPressed(_ sender: Any) {
        let newCount = items.count + 1
        let title = "ToDo Item \(newCount)"
        items.append(.init(title: title))
        let indexPath = IndexPath(row: newCount - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        if newCount >= 10 {
            addButton?.isEnabled = false
        }
    }
}


extension MassiveViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, view, done in
            self.items.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            if self.items.count < 10 {
                self.addButton?.isEnabled = true
            }
            done(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
