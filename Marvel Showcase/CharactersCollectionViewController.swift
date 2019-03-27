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
            collectionView.reloadData()
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
                limit: limit,
                offset: offset,
                success: { container in
                    self.getMoreCharactersDataDask?.cancel()
                    
                    self.characters = container?.results
                    self.total = container?.total
                    self.limit = container?.limit
                    self.offset = (container?.offset ?? 0) + (container?.count ?? 0)
                    
                    guard (container?.total ?? 0) > (self.characters?.count ?? 0) else { return }
                    self.collectionView.register(LoadMoreView.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: LoadMoreView.identifier)
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
        getMoreCharactersDataDask?.cancel()
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let loadMoreView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: LoadMoreView.identifier, for: indexPath) as! LoadMoreView
        
        return loadMoreView
    }
}

extension CharactersCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard (total ?? 0) > (characters?.count ?? 0) else { return }

        guard indexPath.row > collectionView.numberOfItems(inSection: indexPath.section) - 3 else { return }
        
        guard getMoreCharactersDataDask?.isActive != true else { return }
        getMoreCharacters()
    }
    
    private func updateLoadMoreView(_ loadMoreView: LoadMoreView) {
        if getMoreCharactersDataDask?.isActive == true {
            loadMoreView.startLoading(description: "more characters...")
        } else {
            
            let description: String?
            if (total ?? 0) > (characters?.count ?? 0) {
                description = nil
            } else {
                description = "Thats is. 🎉🎊"
            }
            
            loadMoreView.stopLoading(description: description)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {

        guard let loadMoreView = view as? LoadMoreView else { return assertionFailure("Unknown footer view") }
        updateLoadMoreView(loadMoreView)
    }
}

extension CharactersCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        guard characters != nil else { return .zero }
        
        return CGSize(width: collectionView.frame.width, height: 64)
    }
}

extension CharactersCollectionViewController: NibInitializable { }
