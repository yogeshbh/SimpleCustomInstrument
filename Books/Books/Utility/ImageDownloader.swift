//
//  ImageDownloader.swift
//  Books
//
//  Created by Yogesh Bhople on 13/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import Foundation
import UIKit

protocol ImageDownloaderDelegate {
    func downloadComplate(downloader: ImageDownloader ,data: Data?, error:Error?)
}

class ImageDownloader {
    
    var delegate:ImageDownloaderDelegate?
 
    
    init(delegate:ImageDownloaderDelegate) {
        self.delegate = delegate
    }
    
    func Cancel() {
        delegate = nil
    }
    func download(url:String)  {
        var comps = URLComponents(string: url)!
        comps.scheme = "https"

        guard let imageUrl = URL(string: comps.string ?? "") else { return }
        URLSession.shared.dataTask(with: imageUrl) { [weak self] data,_,error  in
            
            guard let data = data, error == nil else {
                self?.delegate?.downloadComplate(downloader: self!,data: nil, error: error)
                return
            }
            DispatchQueue.main.async {
                let imageURL = NSString(string: imageUrl.absoluteString)
                ImageCache.shared.imageCache.setObject(UIImage(data: data)!, forKey: imageURL)
                self?.delegate?.downloadComplate(downloader: self!, data: data, error: error)
            }
        }.resume()
    }
}
