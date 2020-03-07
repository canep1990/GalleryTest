//
//  DefaultMainGalleryRouter.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

protocol MainGalleryRouterDelegate: AnyObject {
    func presentDetails(for photoResult: PhotosListResult)
}

final class DefaultMainGalleryRouter {

    weak var routeDelegate: MainGalleryRouterDelegate?
}

extension DefaultMainGalleryRouter: MainGalleryRouter {

    func presentDetails(for photoResult: PhotosListResult) {
        routeDelegate?.presentDetails(for: photoResult)
    }
}
