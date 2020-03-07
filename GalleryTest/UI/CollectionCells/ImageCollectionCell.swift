//
//  ImageCollectionCell.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 05.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

final class ImageCollectionCell: UICollectionViewCell {

    let imageView = LoadableImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLayout()
    }

    private func configureLayout() {

        contentView.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.backgroundColor = .gray

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
