//
//  RelationCountCollectionViewFlowLayout.swift
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

class RelationCountCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        let itemHeight: CGFloat = 50
        let itemWidth: CGFloat = 52
        
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        minimumInteritemSpacing = 4
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect)?.compactMap({$0.copy() as? UICollectionViewLayoutAttributes}) else {
            return nil
        }
        
        return CollectionViewRow.layoutAttributes(attributes, forElementsIn: rect, collectionView: collectionView, spacing: 4)
    }
}
