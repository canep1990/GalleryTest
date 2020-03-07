//
//  ApplicationCoordinator.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {

    private let applicationServices: ApplicationServices
    private weak var window: UIWindow?
    private weak var navigationController: UINavigationController?

    init(applicationServices: ApplicationServices, window: UIWindow?) {
        self.applicationServices = applicationServices
        self.window = window
    }

    private func createMainGalleryStory() -> UIViewController {
        MainGalleryConfigurator.createModule(with: applicationServices, routeDelegate: self)
    }

    private func createDetailGallery(with photoResult: PhotosListResult) -> UIViewController {
        DetailGalleryConfigurator.createModule(with: applicationServices, photoResult: photoResult)
    }
}

extension ApplicationCoordinator: Coordinator {

    func start() {
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        let vc = createMainGalleryStory()
        navigationController.viewControllers = [vc]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension ApplicationCoordinator: MainGalleryRouterDelegate {

    func presentDetails(for photoResult: PhotosListResult) {
        let vc = createDetailGallery(with: photoResult)
        navigationController?.pushViewController(vc, animated: true)
    }
}
