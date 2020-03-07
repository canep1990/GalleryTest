//
//  ImageCollectionCell+Configuration.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 05.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

extension ImageCollectionCell: ViewConfigurable {
    typealias Model = MainGalleryViewModel

    func configure(with model: MainGalleryViewModel) {
        imageView.loadImage(for: model.imageURL)
    }
}
