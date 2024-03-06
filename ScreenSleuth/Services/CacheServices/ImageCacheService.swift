//
//  ImageCacheService.swift
//  ScreenSleuth
//
//  Created by Home on 6/3/2024.
//

import UIKit

protocol ImageCacheServiceProtocol {
    func saveImage(_ image: UIImage, withKey key: String)
    
    func fetchImage(withKey key: String) -> UIImage?
}

final class ImageCacheService: ImageCacheServiceProtocol {
    
    static var shared = ImageCacheService()
    
    private let cache = NSCache<NSString, UIImage>()

    func fetchImage(withKey key: String) -> UIImage? {
        let image = cache.object(forKey: key as NSString)
        return image
    }
    
    func saveImage(_ image: UIImage, withKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
