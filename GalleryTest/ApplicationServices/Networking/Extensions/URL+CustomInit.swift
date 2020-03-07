//
//  URL+CustomInit.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

extension URL {
    
    init?(path: String, params: [String: Any], method: NetworkRequestHTTPMethod) {
        var components = URLComponents(string: path)

        switch method {
        case .get, .delete:
            components?.queryItems = params.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            }
        default:
            break
        }

        guard let url = components?.url else { return nil }
        self = url
    }
}
