//
//  UIImageView.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import Foundation
import UIKit

class ImageManager {

    static let imageCacher = ImageCacher()
    static var shared = ImageManager()

    private init () { }

    func setImage(with url: String, imageView: UIImageView) {
        ImageManager.imageCacher.downloadAndShowImage(from: url, on: imageView)
    }
}
