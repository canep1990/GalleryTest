//
//  MainGalleryConfigurator.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

enum MainGalleryConfigurator {

    static func createModule(with services: ApplicationServices, routeDelegate: MainGalleryRouterDelegate) -> UIViewController {
        let vc = MainGalleryVC()
        let presenter = DefaultMainGalleryPresenter(view: vc)
        let router = DefaultMainGalleryRouter()
        router.routeDelegate = routeDelegate
        let interactor = DefaultMainGalleryInteractor(presenter, router, and: services.remoteDataSource)
        vc.interactor = interactor
        return vc
    }
}
