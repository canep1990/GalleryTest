//
//  MainGalleryVC.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

final class MainGalleryVC: UIViewController {

    var interactor: MainGalleryInteractor?

    private var viewModels = [MainGalleryViewModel]()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .twoInARowItemsLayout)
    private let loadingIndicatorView = LoadingIndicatorView()
    private let emptyDataLabel = UILabel()
    private let reuseIdentifier = "ImageCollectionCell"
    
    private var contentState: MainContentState = .success {
        didSet {
            showView(for: contentState)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        startLoadingContent()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    private func startLoadingContent() {
        if contentState != .loading {
            contentState = .loading
            interactor?.downloadContent()
        }
    }

    private func configureSubviews() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = Constants.title

        collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self

        emptyDataLabel.text = Constants.noDataText
        emptyDataLabel.textAlignment = .center

        let updateButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(realoadGallery))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = updateButton
    }

    private func showView(for state: MainContentState) {
        switch state {
        case .failed:
            pinViewToSuperviewEdges(emptyDataLabel)
        case .loading:
            pinViewToSuperviewEdges(loadingIndicatorView)
        case .success:
            pinViewToSuperviewEdges(collectionView)
        }
    }

    private func pinViewToSuperviewEdges(_ viewToPin: UIView) {
        view.subviews.forEach { $0.removeFromSuperview() }

        viewToPin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewToPin)

        NSLayoutConstraint.activate([
            viewToPin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            viewToPin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewToPin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            viewToPin.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc
    private func realoadGallery() {
        startLoadingContent()
    }
}

extension MainGalleryVC: MainGalleryView {
    
    func update(with models: [MainGalleryViewModel]) {
        contentState = .success
        viewModels = models
        collectionView.reloadData()
    }

    func present(_ error: Error) {
        contentState = .failed
        let alertController = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.alertButtonTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension MainGalleryVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ImageCollectionCell else {
            fatalError("Unable to dequeue ImageCollectionCell")
        }
        cell.configure(with: viewModels[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.selectedIndex(indexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let height: CGFloat = 204
        let screenWidth = collectionView.bounds.size.width
        return CGSize(width: ((screenWidth - padding * 3) / 2), height: height)
    }
}

private enum Constants {
    static let title = NSLocalizedString("main_gallery_title", comment: "main_gallery_title")
    static let alertButtonTitle = NSLocalizedString("OK", comment: "OK")
    static let noDataText = NSLocalizedString("no_data", comment: "no_data")
}
