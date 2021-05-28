//
//  HomeViewController.swift
//  Books
//
//  Created by Yogesh Bhople on 14/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit

//https://app.quicktype.io/?share=l0KzbhyyDujEeaS98TPx


class HomeViewController: UIViewController {
    
    @IBOutlet var tableview:UITableView?
    var books:[Book]? = []
    
    var jsondata:Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        books = appDelegate?.books
        tableview?.reloadData()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Welcome.self, from: json) {
           
            for item in jsonPetitions.items {
                books?.append(item.volumeInfo)
            }
            tableview?.reloadData()
        }
    }
    
}



extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCellID", for: indexPath) as! HomeTableViewCell
        cell.configure(book: books?[indexPath.row] )
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        if let customViewController = storyboard.instantiateViewController(withIdentifier: "BookDetailsViewControllerID") as? BookDetailsViewController {
            customViewController.book = books?[indexPath.row]
            navigationController?.pushViewController(customViewController, animated: true)
        }
        
    }
}
