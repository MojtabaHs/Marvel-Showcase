//
//  CharacterOverviewView.swift
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

class CharacterOverviewView: UIView {
    
    var character: MarvelAPI.Entity.Core.Character? { didSet { setupData() } }
    
    private let entities: [Entity]  = [.comics, .events, .series, .stories]
    
    lazy var minimumRequiredHieght: CGFloat = {
        guard let bottomMostView = subviews.max(by: { $0.frame.maxY < $1.frame.maxY }) else {
            assertionFailure("Bottom most view not found")
            return 0
        }
        return bottomMostView.frame.maxY - characterImageView.frame.maxY
    }()
    
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var relationsCollectionView: UICollectionView!
    
    private func setupCollectionView() {
        relationsCollectionView.dataSource = self
        relationsCollectionView.register(RelationCountCollectionViewCell.self)
    }
    
    private func setupData() {
        titleLabel.text = character?.name?.uppercased()
        relationsCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
}

extension CharacterOverviewView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entities.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let entity = entities[indexPath.row]
        let cell = collectionView.dequeueReusableCell(cellType: RelationCountCollectionViewCell.self, for: indexPath)!
        let viewModel = RelationCountCollectionViewCell.ViewModel(count: character?.availableItemsCount(for: entity), entity: entity)
        cell.viewModel = viewModel
        return cell
    }
}

extension CharacterOverviewView: NibInitializable { }
