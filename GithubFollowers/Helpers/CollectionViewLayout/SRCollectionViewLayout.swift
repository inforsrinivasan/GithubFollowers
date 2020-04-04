//
//  SRCollectionViewLayout.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-03.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

struct SRCollectionViewLayout {

    static func createColumnFlowLayout(view: UIView, numberOfColumns: Int) -> UICollectionViewFlowLayout {
        return generateFlowLayout(size: view.bounds.size, numberOfColumns: numberOfColumns)
    }

    private static func generateFlowLayout(size: CGSize, numberOfColumns: Int, existing layout: UICollectionViewFlowLayout? = nil) -> UICollectionViewFlowLayout {

        let width = size.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10

        let totalPadding = 2 * padding
        let numberOfSpaces = numberOfColumns - 1
        let totalSpacing = minimumItemSpacing * CGFloat(numberOfSpaces)
        let availableWidth = (width - totalPadding) - totalSpacing

        let itemWidth = availableWidth / CGFloat(numberOfColumns)

        let flowLayout = layout ?? UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout

    }

}
