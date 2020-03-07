//
//  NetworkRequest.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

public enum NetworkRequestHTTPMethod: String {
    case options = "OPTIONS"
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case trace = "TRACE"
    case connect = "CONNECT"
}

public protocol NetworkRequest {
    var httpMethod: NetworkRequestHTTPMethod { get }
    var path: String { get }
    var httpHeaders: [String: String] { get }
    var queryParameters: [String: String] { get }
}

public extension NetworkRequest {
    var httpHeaders: [String: String] {
        return [:]
    }
    var queryParameters: [String: String] {
        return [:]
    }
}
