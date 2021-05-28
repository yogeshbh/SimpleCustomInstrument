//
//  HomeTableViewCell.swift
//  Books
//
//  Created by Yogesh Bhople on 14/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit
import os.signpost


func downloadComplate(downloader: ImageDownloader, data: Data?, error: Error?) {
    let signpostID = OSSignpostID (log: SignpostLog.networking, object:downloader )
    
    var dataSize: Int64 = 0
    if let data = data , error == nil {
        bookImage?.image = UIImage(data: data)
        book?.image = UIImage(data: data)
        dataSize = Int64(data.count)
    }
    os_signpost(.end, log: SignpostLog.networking, name: "Background Image", signpostID: signpostID, "Status:%{public}@,Size:%llu", "Completed", dataSize)
    self.runningDownloader = nil
}
