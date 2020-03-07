//
//  UICollectionView+Layouts.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 05.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

extension UICollectionViewLayout {

    class var twoInARowItemsLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let padding: CGFloat = 16
        let height: CGFloat = 204
        let screenWidth = UIScreen.main.bounds.size.width
        layout.itemSize = CGSize(width: ((screenWidth - padding * 3) / 2), height: height)
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .vertical
        return layout
    }
}
