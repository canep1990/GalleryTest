//
//  DefaultMainGalleryInteractor.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

final class DefaultMainGalleryInteractor {

    let presenter: MainGalleryPresenter
    let router: MainGalleryRouter
    let remoteDataSource: RemoteDataSource

    private var loadedPhotos: [PhotosListResult] = []

    init(_ presenter: MainGalleryPresenter, _ router: MainGalleryRouter, and remoteDataSource: RemoteDataSource) {
        self.presenter = presenter
        self.router = router
        self.remoteDataSource = remoteDataSource
    }

    private func downloadPhotos(_ completion: ((Result<[PhotosListResult], Error>) -> Void)?) {
        remoteDataSource.loadPhotosList { result in
            completion?(result)
        }
    }
}

extension DefaultMainGalleryInteractor: MainGalleryInteractor {
    
    func downloadContent() {
        downloadPhotos { [weak self] result in
            guard let self = self else { return }
            if case .success(let photos) = result {
                self.loadedPhotos = photos
            }
            DispatchQueue.main.async {
                self.presenter.handle(result)
            }
        }
    }

    func selectedIndex(_ index: Int) {
        router.presentDetails(for: loadedPhotos[index])
    }
}
