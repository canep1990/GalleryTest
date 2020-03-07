//
//  PhotosListRequest.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

public struct PhotosListRequest: NetworkRequest {

    public let httpMethod: NetworkRequestHTTPMethod = .get
    public let path: String = "https://picsum.photos/v2/list"
}
