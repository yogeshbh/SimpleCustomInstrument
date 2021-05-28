//
//  HomeTableViewCell.swift
//  Books
//
//  Created by Yogesh Bhople on 14/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit
import os.signpost

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet var bookImage: UIImageView?
    @IBOutlet var bookLabel: UILabel?
    var runningDownloader: ImageDownloader?
    
    var book: Book?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(book: Book?) {
        if let b = book {
            self.book = book
            bookLabel?.text = b.title
            if let _ = book?.imageLinks?.thumbnail {
                startDownload()
            }
            
        }
        
    }
    
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
    
    func startDownload() {
        let downloader = ImageDownloader(delegate: self)
        
        let signpostID = OSSignpostID (log: SignpostLog.networking, object:downloader )
        
        let address = unsafeBitCast(self, to: UInt.self)
        let addressString = String(address)
        
        os_signpost(.begin, log: SignpostLog.networking, name: "Background Image", signpostID: signpostID, "Image name:%{public}@,Caller:%{public}@", book?.title ?? "",addressString)
        downloader.download(url: book?.imageLinks?.thumbnail ?? "")
        
        self.runningDownloader = downloader

    }

}

extension HomeTableViewCell: ImageDownloaderDelegate {
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
    
    
}
