//
//  CarouselFlowLayout.swift
//  RxSwiftWorkspace
//
//  Created by lym on 2022/12/26.
//  Copyright © 2022 lym. All rights reserved.
//

import UIKit

public enum CoverFlowLayoutSpacingMode {
    case fixed(visibleOffset: CGFloat)
    case overlap(visibleOffset: CGFloat)
}

class CoverFlowLayout: UICollectionViewFlowLayout {
    fileprivate struct LayoutState {
        var size: CGSize
        var direction: UICollectionView.ScrollDirection
        func isEqual(_ otherState: LayoutState) -> Bool {
            return size.equalTo(otherState.size) && direction == otherState.direction
        }
    }

    @IBInspectable open var sideItemScale: CGFloat = 0.6
    @IBInspectable open var sideItemAlpha: CGFloat = 0.6
    /// 非滚动方向的偏移
    @IBInspectable open var sideItemShift: CGFloat = 0.0

    open var spacingMode: CoverFlowLayoutSpacingMode = .fixed(visibleOffset: 40)

    fileprivate var state = LayoutState(size: .zero, direction: .horizontal)

    override open func prepare() {
        super.prepare()
        let currentState = LayoutState(size: collectionView!.bounds.size, direction: scrollDirection)

        if !state.isEqual(currentState) {
            setupCollectionView()
            updateLayout()
            state = currentState
        }
    }

    fileprivate func setupCollectionView() {
        guard let collectionView = collectionView else { return }
        if collectionView.decelerationRate != .fast {
            collectionView.decelerationRate = .fast
        }
    }

    fileprivate func updateLayout() {
        guard let collectionView = collectionView else { return }

        let collectionSize = collectionView.bounds.size
        let isHorizontal = (scrollDirection == .horizontal)

        let yInset = (collectionSize.height - itemSize.height) / 2
        let xInset = (collectionSize.width - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
        let side = isHorizontal ? itemSize.width : itemSize.height
        let scaledItemOffset = (side - side * sideItemScale) / 2

        switch spacingMode {
        case let .fixed(visibleOffset):
            minimumLineSpacing = visibleOffset - scaledItemOffset

        case let .overlap(visibleOffset):
            let fullSizeSideItemOverlap = visibleOffset + scaledItemOffset
            let inset = isHorizontal ? xInset : yInset
            minimumLineSpacing = inset - fullSizeSideItemOverlap
        }
    }

    override open func shouldInvalidateLayout(forBoundsChange _: CGRect) -> Bool {
        return true
    }

    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superAttributes = super.layoutAttributesForElements(in: rect),
              let attributes = NSArray(array: superAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes]
        else { return nil }
        return attributes.map { self.transformLayoutAttributes($0) }
    }

    fileprivate func transformLayoutAttributes(
        _ attributes: UICollectionViewLayoutAttributes
    ) -> UICollectionViewLayoutAttributes {
        guard let collectionView = collectionView else { return attributes }
        let isHorizontal = (scrollDirection == .horizontal)
        let collectionCenter = isHorizontal ? collectionView.bounds.width / 2 : collectionView.bounds.height / 2
        let offset = isHorizontal ? collectionView.contentOffset.x : collectionView.contentOffset.y
        let normalizedCenter = (isHorizontal ? attributes.center.x : attributes.center.y) - offset

        let maxDistance = (isHorizontal ? itemSize.width : itemSize.height) + minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        let ratio = (maxDistance - distance) / maxDistance

        let alpha = ratio * (1 - sideItemAlpha) + sideItemAlpha
        let scale = ratio * (1 - sideItemScale) + sideItemScale
        let shift = (1 - ratio) * sideItemShift
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        attributes.zIndex = Int(alpha * 10)

        if isHorizontal {
            attributes.center.y += shift
        } else {
            attributes.center.x += shift
        }
        return attributes
    }

    override open func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity _: CGPoint
    ) -> CGPoint {
        guard let collectionView = collectionView, !collectionView.isPagingEnabled,
              let layoutAttributes = layoutAttributesForElements(in: collectionView.bounds)
        else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset) }

        let isHorizontal = (scrollDirection == .horizontal)
        let midSide = (isHorizontal ? collectionView.bounds.width : collectionView.bounds.height) / 2
        let proposedOffset = (isHorizontal ? proposedContentOffset.x : proposedContentOffset.y) + midSide

        var targetContentOffset: CGPoint
        if isHorizontal {
            let closest = layoutAttributes.sorted {
                abs($0.center.x - proposedOffset) < abs($1.center.x - proposedOffset)
            }.first ?? UICollectionViewLayoutAttributes()
            targetContentOffset = CGPoint(x: floor(closest.center.x - midSide), y: proposedContentOffset.y)

        } else {
            let closest = layoutAttributes.sorted {
                abs($0.center.y - proposedOffset) < abs($1.center.y - proposedOffset)
            }.first ?? UICollectionViewLayoutAttributes()
            targetContentOffset = CGPoint(x: proposedContentOffset.x, y: floor(closest.center.y - midSide))
        }
        return targetContentOffset
    }
}
