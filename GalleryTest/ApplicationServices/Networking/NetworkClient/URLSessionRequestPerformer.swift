//
//  URLSessionRequestPerformer.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

final class URLSessionRequestPerformer {

    private let session = URLSession(configuration: .ephemeral)
    private let networkReachability: NetworkReachability?

    init(_ networkReachability: NetworkReachability?) {
        self.networkReachability = networkReachability
    }
}

extension URLSessionRequestPerformer: NetworkRequestPerformer {

    func perform(_ request: NetworkRequest, completion: ((NetworkRequestResult) -> Void)?) {

        guard networkReachability?.isReachable ?? false else {
            completion?(NetworkRequestResult(data: nil, error: NetworkError.noInternetConnection))
            return
        }

        guard let urlRequest = URLRequest(path: request.path, params: request.queryParameters, method: request.httpMethod, headers: request.httpHeaders) else {
            completion?(NetworkRequestResult(data: nil, error: NetworkError.invalidURLRequest))
            return
        }

        let task = session.dataTask(with: urlRequest) {
            let response = (data: $0, response: $1, error: $2)

            if let error = response.2 {
                completion?(NetworkRequestResult(data: response.0, error: error))
            } else {
                if let httpResponse = response.1 as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                    completion?(NetworkRequestResult(data: response.0, error: nil))
                } else {
                    completion?(NetworkRequestResult(data: response.0, error: NetworkError.unacceptedHTTPStatusCode))
                }
            }
        }
        task.resume()

    }
}

private enum Constants {
    static let unauthorizedCode = 401
}
