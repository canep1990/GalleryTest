//
//  String+Extensions.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 04.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import Foundation

extension String {
    var removingWhitespacesAndNewLines: String {
        return components(separatedBy: .whitespacesAndNewlines).joined()
    }
}
