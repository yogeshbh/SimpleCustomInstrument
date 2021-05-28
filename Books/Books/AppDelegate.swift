//
//  AppDelegate.swift
//  Books
//
//  Created by Yogesh Bhople on 13/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController:UINavigationController?
    
    var books:[Book]? = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let _ = loadData()
        

        return true
    }
    
    func loadData() -> Bool {
        let urlPath = Bundle.main.url(forResource: "booksdata", withExtension: "json")!
        
        guard let json = try? Data(contentsOf: urlPath) else { return true }
        
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Welcome.self, from: json) {
            for item in jsonPetitions.items {
                books?.append(item.volumeInfo)
            }
        }
        
        return true
    }
    
    func loadDataAsync(completionHandler: @escaping () -> Void) {
        
        DispatchQueue.global().async { [weak self] in
            let urlPath = Bundle.main.url(forResource: "booksdata", withExtension: "json")!
            
            guard let json = try? Data(contentsOf: urlPath) else { return  }
            
            let decoder = JSONDecoder()
            
            if let jsonPetitions = try? decoder.decode(Welcome.self, from: json) {
                for item in jsonPetitions.items {
                    self?.books?.append(item.volumeInfo)
                }
            }
            completionHandler()
        }
    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

