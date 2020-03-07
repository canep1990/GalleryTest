//
//  DefaultApplicationServices.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

struct DefaultApplicationServices: ApplicationServices {

    var remoteDataSource: RemoteDataSource {
        DefaultRemoteDataSource(URLSessionRequestPerformer(DefaultNetworkReachability()))
    }
}
