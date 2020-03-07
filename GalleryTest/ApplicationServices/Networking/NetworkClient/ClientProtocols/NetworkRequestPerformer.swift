//
//  NetworkRequestPerformer.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

public protocol NetworkRequestPerformer {
    func perform(_ request: NetworkRequest, completion: ((NetworkRequestResult) -> Void)?)
}
