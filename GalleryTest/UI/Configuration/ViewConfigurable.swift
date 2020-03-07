//
//  ViewConfigurable.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 05.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

protocol ViewConfigurable {
    associatedtype Model
    func configure(with model: Model)
}
