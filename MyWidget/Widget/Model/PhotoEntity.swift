//
//  PhotoEntity.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/31/24.
//

import UIKit

struct PhotoEntity: Codable {
    let items: [Item]
    
    struct Item: Codable {
        let media: Media
        
        struct Media: Codable {
            let m: String
        }
    }
}

struct Photo {
    let url: String
    let image: UIImage
}
