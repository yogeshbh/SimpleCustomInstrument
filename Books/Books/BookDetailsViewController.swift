//
//  BookDetailsViewController.swift
//  Books
//
//  Created by Yogesh Bhople on 16/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit
import os.signpost
class BookDetailsViewController: UIViewController {
    
    @IBOutlet var image: UIImageView?
    @IBOutlet var bookTitle: UILabel?
    @IBOutlet var bookDescription: UILabel?
    
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        bookTitle?.text = book?.title
        bookDescription?.text = book?.volumeInfoDescription
        
        if let img = book?.image {
            image?.image = img
        } else {
            
            
            var comps = URLComponents(string: book?.imageLinks?.thumbnail ?? "")!
            comps.scheme = "https"
            guard let imageUrl = URL(string: comps.string ?? "") else { return }
            let imageURL = NSString(string: imageUrl.absoluteString)
            image?.image = ImageCache.shared.imageCache.object(forKey: imageURL)
            print(ImageCache.shared.imageCache.countLimit)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        os_signpost(.event, log: SignpostLog.pointOFInterest, name: "Details Appeared", "%{public}@", book?.title ?? "")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
