//
//  ImageCacheManager.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import Foundation

// MARK: - Image Cache Manager
class ImageCacheManager {
    static let shared = ImageCacheManager()
    private var cache = NSCache<NSString, NSData>()
    
    private init() {}
    
    func getImageData(forKey key: String) -> Data? {
        return cache.object(forKey: key as NSString) as Data?
    }
    
    func setImageData(_ data: Data, forKey key: String) {
        cache.setObject(data as NSData, forKey: key as NSString)
    }
}

