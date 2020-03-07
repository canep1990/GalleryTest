//
//  CodableResultMapper.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

public struct CodableResultMapper {

    func map<ResponseType: Codable>(_ result: NetworkRequestResult) -> Result<ResponseType, Error> {
        if let error = result.error {
            return .failure(error)
        } else {
            if let data = result.data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(ResponseType.self, from: data)
                    return .success(result)
                } catch {
                    return .failure(error)
                }
            } else {
                return .failure(NetworkError.unexpectedServerResponse)
            }
        }
    }
}
