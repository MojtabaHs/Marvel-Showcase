//
//  UICollectionViewExtension.swift
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

extension UICollectionView {
    
    func register<T: ReusableCollectionViewCell & NibInitializable & StructureIdentifiable>(_ cell: T.Type) {
        register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: ReusableCollectionViewCell & StructureIdentifiable>(cellType: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T
    }
}

protocol ReusableCollectionViewCell { }
extension UICollectionViewCell: ReusableCollectionViewCell { }
