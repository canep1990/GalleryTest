//
//  DefaultRemoteDataSource.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

final class DefaultRemoteDataSource {

    private let requestPerformer: NetworkRequestPerformer
    private let requestResultMapper = CodableResultMapper()

    init(_ requestPerformer: NetworkRequestPerformer) {
        self.requestPerformer = requestPerformer
    }
}

extension DefaultRemoteDataSource: RemoteDataSource {

    func loadPhotosList(_ completion: ((Result<[PhotosListResult], Error>) -> Void)?) {
        let apiCall = PhotosListAPICall(requestPerformer)
        apiCall.perform { result in
            let mappedResult: Result<[PhotosListResult], Error> = self.requestResultMapper.map(result)
            completion?(mappedResult)
        }
    }
}
