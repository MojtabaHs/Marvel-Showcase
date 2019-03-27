//
//  CharactersCollectionViewFlowLayout.swift
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

class CharactersCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return assertionFailure("Collection view not found") }
        
        let padding: CGFloat = 24
        
        let availableWidth = collectionView.bounds.width
        let minimumClumnWidth: CGFloat = availableWidth - 2*padding
        let maxNumberOfItems = Int(availableWidth/minimumClumnWidth)
        let itemWidth = (availableWidth / CGFloat(maxNumberOfItems) - 2*padding).rounded(.down)
        
        itemSize = CGSize(width: itemWidth, height: itemWidth + 134)
        
        minimumInteritemSpacing = padding
        minimumLineSpacing = padding * 2
        sectionInset = UIEdgeInsets(top: padding*2, left: padding, bottom: padding, right: padding)
    }
}
