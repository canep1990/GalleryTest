//
//  NetworkError.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case noInternetConnection
    case invalidURLRequest
    case unacceptedHTTPStatusCode
    case unexpectedServerResponse
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unacceptedHTTPStatusCode:
            return Constants.serverNotResponding
        case .noInternetConnection:
            return Constants.noInternetConnection
        case .unexpectedServerResponse:
            return Constants.unexpectedServerResponse
        case .invalidURLRequest:
            return Constants.invalidURLRequest
        }
    }
}

private enum Constants {
    static let serverNotResponding = NSLocalizedString("server_not_responding", comment: "server_not_responding")
    static let noInternetConnection = NSLocalizedString("no_internet_connection", comment: "no_internet_connection")
    static let unexpectedServerResponse = NSLocalizedString("unexpected_response", comment: "unexpected_response")
    static let invalidURLRequest = NSLocalizedString("invalid_url_request", comment: "invalid_url_request")
}
