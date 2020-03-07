//
//  LoadingIndicatorView.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 06.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

final class LoadingIndicatorView: UIView {

    private let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    private let infoLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLayout()
    }

    private func configureLayout() {

        activityIndicatorView.startAnimating()
        activityIndicatorView.color = .gray
        infoLabel.text = Constants.loadingText

        [activityIndicatorView, infoLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),

            infoLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor),
            infoLabel.centerXAnchor.constraint(equalTo: activityIndicatorView.centerXAnchor)
        ])
    }
}

private enum Constants {
    static let loadingText = NSLocalizedString("loading", comment: "loading")
}
