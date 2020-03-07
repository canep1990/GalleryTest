//
//  UIImageView+AsyncImageCaching.swift
//  GalleryTest
//
//  Created by Юрий Воскресенский on 05.03.2020.
//  Copyright © 2020 Voskresenskii Iurii. All rights reserved.
//

import UIKit

enum Cache {
    static var imageCache = [String: UIImage]()
}

final class LoadableImageView: UIImageView {

    private var imageURL = ""

    func loadImage(for url: String) {
        imageURL = url
        self.image = nil

        guard let imageURL = URL(string: url) else { return }

        if let cachedImage = Cache.imageCache[url] {
            self.image = cachedImage
            return
        }

        URLSession.shared.dataTask(with: imageURL) { data, response, error in

            if let loadedImageData = data,
                let loadedImage = UIImage(data: loadedImageData),
                let scaledImage = loadedImage.resizeImage(targetSize: CGSize(width: Constants.targetImageSize, height: Constants.targetImageSize)) {
                Cache.imageCache[url] = scaledImage
                DispatchQueue.main.async {
                    if self.imageURL == url {
                        self.image = scaledImage
                    }
                }
            } else {
                Cache.imageCache[url] = nil
            }
        }
        .resume()
    }
}

private enum Constants {
    static let targetImageSize: CGFloat = 600
}
