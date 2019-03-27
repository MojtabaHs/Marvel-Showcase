//
//  CharactersCollectionViewController.swift
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

class CharactersCollectionViewController: UICollectionViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    private var getInitialCharactersDataDask: URLSessionDataTask?
    private var characters: [MarvelAPI.Entity.Core.Character]? {
        didSet {
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        collectionView.register(CharacterOverviewCollectionViewCell.self, forCellWithReuseIdentifier: CharacterOverviewCollectionViewCell.identifier)
        
        getInitialCharacters()
    }
    
    private func getInitialCharacters() {
        do {
            getInitialCharactersDataDask = try MarvelAPI.CharactersRouter.Endpoint.Characters.get(
                success: { characters in
                    self.characters = characters
            },
                failure: { error in
                    print(error)
            })
        } catch {
            print(error)
        }
    }
    
    deinit {
        getInitialCharactersDataDask?.cancel()
    }
}

extension CharactersCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let character = characters?[indexPath.row] else { fatalError("Character not found") }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterOverviewCollectionViewCell.identifier, for: indexPath) as! CharacterOverviewCollectionViewCell
        cell.character = character
        return cell
    }
}

extension CharactersCollectionViewController: NibInitializable { }
