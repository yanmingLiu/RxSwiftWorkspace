//
//  UICollectionViewMove.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2021/3/2.
//  Copyright © 2021 lym. All rights reserved.
//

import UIKit

class ItemModle {
    var name: String!
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class UICollectionViewMove: UIViewController {
    var itemNames = [ItemModle]()

    var myCollectionView: UICollectionView!

    var dragingIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        let arr = ["关注", "推荐", "视频", "热点", "北京", "新时代", "图片", "头条号", "娱乐", "问答", "体育", "科技", "懂车帝", "财经", "军事", "国际"]
        itemNames = arr.map { name in
            ItemModle(name: name)
        }

        initUI()
    }
}

extension UICollectionViewMove {
    func initUI() {
        // 计算单个Item的大小
        let width: CGFloat = (view.frame.width - 5 * 10) / 4
        let height: CGFloat = 40

        let flowLayout = UICollectionViewFlowLayout()
        // 滚动方向
        flowLayout.scrollDirection = .vertical
        // 网格中各行项目之间使用的最小间距
        flowLayout.minimumLineSpacing = 10
        // 在同一行中的项目之间使用的最小间距
        flowLayout.minimumInteritemSpacing = 10
        // 用于单元格的默认大小
        flowLayout.itemSize = CGSize(width: width, height: height)

        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        myCollectionView.backgroundColor = .white
        myCollectionView.delegate = self
        myCollectionView.dataSource = self

        // 示集合视图是否支持应用程序之间的拖放
        myCollectionView.dragInteractionEnabled = true
        myCollectionView.dragDelegate = self
        myCollectionView.dropDelegate = self

        view.addSubview(myCollectionView)

        myCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        myCollectionView.register(UINib(nibName: "EditCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: EditCollectionViewCell.forCellReuseIdentifier)
    }
}

// MARK: - UICollectionViewDelegate

extension UICollectionViewMove: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - UICollectionViewDropDelegate

extension UICollectionViewMove: UICollectionViewDropDelegate {
    /// 处理拖动放下后如何处理
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath else {
            return
        }
        switch coordinator.proposal.operation {
        case .move:
            let items = coordinator.items
            if let item = items.first, let sourceIndexPath = item.sourceIndexPath {
                // 执行批量更新
                collectionView.performBatchUpdates({
                    self.itemNames.remove(at: sourceIndexPath.row)
                    self.itemNames.insert(item.dragItem.localObject as! ItemModle, at: destinationIndexPath.row)
                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [destinationIndexPath])
                })
                // 将项目动画化到视图层次结构中的任意位置
                coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
            }
            break
        case .copy:
            // 执行批量更新
            collectionView.performBatchUpdates({
                var indexPaths = [IndexPath]()
                for (index, item) in coordinator.items.enumerated() {
                    let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                    self.itemNames.insert(item.dragItem.localObject as! ItemModle, at: indexPath.row)
                    indexPaths.append(indexPath)
                }
                collectionView.insertItems(at: indexPaths)
            })
            break
        default:
            return
        }
    }

    /// 处理拖动过程中
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        guard dragingIndexPath?.section == destinationIndexPath?.section else {
            return UICollectionViewDropProposal(operation: .forbidden)
        }
        if session.localDragSession != nil {
            if collectionView.hasActiveDrag {
                return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
            } else {
                return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
            }
        } else {
            return UICollectionViewDropProposal(operation: .forbidden)
        }
    }
}

// MARK: - UICollectionViewDragDelegate

extension UICollectionViewMove: UICollectionViewDragDelegate {
    /// 处理首次拖动时，是否响应
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = itemNames[indexPath.row]
        let itemProvider = NSItemProvider(object: item.name as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        dragingIndexPath = indexPath
        return [dragItem]
    }
}

// MARK: - UICollectionViewDataSource

extension UICollectionViewMove: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EditCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: EditCollectionViewCell.forCellReuseIdentifier, for: indexPath) as! EditCollectionViewCell
        let model = itemNames[indexPath.row]
        cell.titleLabel.text = model.name
        cell.contentView.backgroundColor = .random
        return cell
    }
}
