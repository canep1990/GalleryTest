//
//  PhotosListResult.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

public struct PhotosListResult: Codable {

    public let id: String
    public let author: String
    public let width: Int
    public let height: Int
    public let downloadURL: String

    private enum CodingKeys: String, CodingKey {
        case downloadURL = "download_url"
        case id
        case author
        case width
        case height
    }
}
