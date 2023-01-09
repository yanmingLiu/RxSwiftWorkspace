//
//  CarouselFlowLayoutController.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2022/12/26.
//  Copyright © 2022 lym. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CarouselCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = UIColor(
            red: CGFloat(arc4random_uniform(255)) / 255,
            green: CGFloat(arc4random_uniform(255)) / 255,
            blue: CGFloat(arc4random_uniform(255)) / 255,
            alpha: 1
        )
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CoverFlowLayoutController: UIViewController {
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = UIScreen.main.bounds.width - 28 * 2
        let height = width + 100

        let layout = CoverFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: width, height: height)
//        layout.spacingMode = .overlap(visibleOffset: 12)
        layout.spacingMode = .fixed(visibleOffset: 12)
        layout.sideItemScale = 0.8
        layout.sideItemAlpha = 0.5

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightGray
        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

extension CoverFlowLayoutController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 113
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        return cell
    }
}
