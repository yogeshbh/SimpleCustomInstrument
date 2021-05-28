//
//  HomeTableViewCell.swift
//  Books
//
//  Created by Yogesh Bhople on 14/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit
import os.signpost


func startDownload() {
    let downloader = ImageDownloader(delegate: self)
    
    let signpostID = OSSignpostID (log: SignpostLog.networking, object:downloader )
    
    let address = unsafeBitCast(self, to: UInt.self)
    let addressString = String(address)
    
    os_signpost(.begin, log: SignpostLog.networking, name: "Background Image", signpostID: signpostID, "Image name:%{public}@,Caller:%{public}@", book?.title ?? "",addressString)
    downloader.download(url: book?.imageLinks?.thumbnail ?? "")
    
    self.runningDownloader = downloader
    
}
