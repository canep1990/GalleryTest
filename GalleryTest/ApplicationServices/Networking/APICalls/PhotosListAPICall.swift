//
//  PhotosListAPICall.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

public struct PhotosListAPICall {

    private let requestPerformer: NetworkRequestPerformer

    public init(_ requestPerformer: NetworkRequestPerformer) {
        self.requestPerformer = requestPerformer
    }

    public func perform(_ completion: ((NetworkRequestResult) -> Void)?) {
        let request = PhotosListRequest()
        requestPerformer.perform(request, completion: { result in
            completion?(result)
        })
    }
}
