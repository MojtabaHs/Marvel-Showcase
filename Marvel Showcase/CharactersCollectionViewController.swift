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
    private var getMoreCharactersDataDask: URLSessionDataTask?
    
    private var characters: [MarvelAPI.Entity.Core.Character]? {
        didSet {
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
        }
    }
    
    private var total: Int?
    private var limit: Int? = 20 // For the shake of the assignment
    private var offset: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        collectionView.register(CharacterOverviewCollectionViewCell.self, forCellWithReuseIdentifier: CharacterOverviewCollectionViewCell.identifier)
        
        getInitialCharacters()
    }
    
    private func getInitialCharacters() {
        do {
            getInitialCharactersDataDask = try MarvelAPI.CharactersRouter.Endpoint.Characters.get(
                success: { container in
                    self.getMoreCharactersDataDask?.cancel()
                    
                    self.characters = container?.results
                    self.total = container?.total
                    self.limit = container?.limit
                    self.offset = (container?.offset ?? 0) + (container?.count ?? 0)
            },
                failure: { error in
                    print(error)
            })
        } catch {
            print(error)
        }
    }
    
    private func getMoreCharacters() {
        do {
            getMoreCharactersDataDask = try MarvelAPI.CharactersRouter.Endpoint.Characters.get(
                limit: limit,
                offset: offset,
                success: { container in
                    self.characters?.append(contentsOf: container?.results ?? [])
                    self.total = container?.total
                    self.limit = container?.limit
                    self.offset = (container?.offset ?? 0) + (container?.count ?? 0)
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

extension CharactersCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard collectionView.numberOfItems(inSection: indexPath.section) - 3 < indexPath.row else { return }
        
        guard (total ?? 0) > (characters?.count ?? 0) else { return }
        guard getMoreCharactersDataDask?.isComplete != false else { return }
        getMoreCharacters()
    }
}

extension CharactersCollectionViewController: NibInitializable { }

extension URLSessionDataTask {
    var isComplete: Bool {
        guard error == nil else { return true }
        guard response == nil else { return true }
        return false
    }
}
