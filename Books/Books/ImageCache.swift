//
//  ImageCache.swift
//  Books
//
//  Created by Yogesh Bhople on 16/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit

class ImageCache {

    var imageCache:NSCache<NSString,UIImage> = NSCache<NSString,UIImage>()
    static let shared = ImageCache()
    
    private init(){}

}
