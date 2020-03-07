//
//  MainGalleryProtocols.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

protocol MainGalleryInteractor {
    func downloadContent()
    func selectedIndex(_ index: Int)
}

protocol MainGalleryPresenter {
    func handle(_ result: Result<[PhotosListResult], Error>)
}

protocol MainGalleryView: AnyObject {
    func update(with models: [MainGalleryViewModel])
    func present(_ error: Error)
}

protocol MainGalleryRouter: AnyObject {
    func presentDetails(for photoResult: PhotosListResult)
}
