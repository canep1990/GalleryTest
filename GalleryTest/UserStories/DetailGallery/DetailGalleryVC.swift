//
//  DetailGalleryVC.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

final class DetailGalleryVC: UIViewController {

    var photoResult: PhotosListResult?

    private let imageView = LoadableImageView()
    private let infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }

    private func configureSubviews() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = Constants.detailsTitle

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center

        if let result = photoResult {
            imageView.loadImage(for: result.downloadURL)
            infoLabel.text = "\(Constants.author) : \(result.author) \n\(Constants.width) : \(result.width) \n\(Constants.height) : \(result.height)"
        }

        [imageView, infoLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: Constants.imageViewWidth),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.topPadding),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),

            infoLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.topPadding),

            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
        ])
    }
}

private enum Constants {
    static let detailsTitle = NSLocalizedString("details", comment: "details")
    static let author = NSLocalizedString("author", comment: "author")
    static let width = NSLocalizedString("width", comment: "width")
    static let height = NSLocalizedString("height", comment: "height")

    static let imageViewWidth: CGFloat = 200
    static let imageViewHeight: CGFloat = 300

    static let topPadding: CGFloat = 20

}
