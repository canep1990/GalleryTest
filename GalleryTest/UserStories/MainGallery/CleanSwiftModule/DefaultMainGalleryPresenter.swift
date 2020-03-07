//
//  DefaultMainGalleryPresenter.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

final class DefaultMainGalleryPresenter {

    weak var view: MainGalleryView?

    init(view: MainGalleryView) {
        self.view = view
    }
}

extension DefaultMainGalleryPresenter: MainGalleryPresenter {

    func handle(_ result: Result<[PhotosListResult], Error>) {

        switch result {
        case .success(let photos):
            self.view?.update(with:
                photos.compactMap {
                    MainGalleryViewModel(imageURL: $0.downloadURL)
                }
            )
        case .failure(let error):
            self.view?.present(error)
        }
    }
}
