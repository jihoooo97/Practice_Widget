//
//  ImageCache.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/31/24.
//

import UIKit

final class ImageCache {
    
    static let shared = NSCache<NSString, UIImage>()
    
    private init() { }
    
}
