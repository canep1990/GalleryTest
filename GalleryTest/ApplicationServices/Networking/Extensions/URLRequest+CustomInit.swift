//
//  URLRequest+CustomInit.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

extension URLRequest {

    init?(path: String, params: [String: Any], method: NetworkRequestHTTPMethod, headers: [String: String] = [:]) {
        guard let url = URL(path: path, params: params, method: method) else { return nil }
        self.init(url: url)
        httpMethod = method.rawValue
        setValue("application/json", forHTTPHeaderField: "Accept")
        setValue("application/json", forHTTPHeaderField: "Content-Type")

        headers.forEach {
            setValue($1, forHTTPHeaderField: $0)
        }
        
        switch method {
        case .post, .put, .head, .patch, .trace, .connect:
            if let jsonBody = try? JSONSerialization.data(withJSONObject: params) {
                httpBody = jsonBody
            }
        default:
            break
        }
    }
}
