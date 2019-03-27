//
//  AppNavigationRouter.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/27/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import UIKit
import MarvelAPI

class AppNavigationRouter {
    
    private init(){}
    static let shared = AppNavigationRouter()
    
    func showCharacterDetails(characterId: Int?, character: MarvelAPI.Entity.Core.Character?, rootViewController: UIViewController) {
        
        let characterTableViewController = CharacterTableViewController()
        characterTableViewController.character = character
        characterTableViewController.characterId = characterId
        
        rootViewController.show(characterTableViewController, sender: nil)
    }
}
