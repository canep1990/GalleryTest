//
//  DetailGalleryConfigurator.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

enum DetailGalleryConfigurator {

    static func createModule(with services: ApplicationServices, photoResult: PhotosListResult) -> UIViewController {
        let vc = DetailGalleryVC()
        vc.photoResult = photoResult
        return vc
    }
}
