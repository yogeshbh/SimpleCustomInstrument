//
//  HomeTableViewCell.swift
//  Books
//
//  Created by Yogesh Bhople on 14/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit
import os.signpost


override func prepareForReuse() {
    super.prepareForReuse()
    bookImage?.image = UIImage(named: "placeholder")
    
    if let downloaderinProgress = runningDownloader {
        let signpostID = OSSignpostID (log: SignpostLog.networking, object:downloaderinProgress )
        downloaderinProgress.Cancel()
        os_signpost(.end, log: SignpostLog.networking, name: "Background Image", signpostID: signpostID, "Status:%{public}@,Size:%llu", "Canceled", 0)
        runningDownloader = nil
    }
    
}

