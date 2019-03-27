//
//  AppDelegate.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/22/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let layout = CharactersCollectionViewFlowLayout()
        let charactersCollectionViewController = CharactersCollectionViewController(collectionViewLayout: layout)
        charactersCollectionViewController.collectionView.backgroundColor = #colorLiteral(red: 0.05531399917, green: 0.08442663031, blue: 0.1193617877, alpha: 1)
        
        window?.rootViewController =  charactersCollectionViewController
        window?.makeKeyAndVisible()
        
        UIApplication.shared.setStatusBarHidden(false, with: .slide)
        return true
    }

}

