//
//  RelationCountCollectionViewCell.swift
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

class RelationCountCollectionViewCell: UICollectionViewCell {
    
    var viewModel: ViewModel? { didSet { setupDataIfNeeded() } }
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private func setupDataIfNeeded() {
        guard let viewModel = viewModel else { return }
        iconImageView.image = viewModel.entity?.icon
        countLabel.text = String(viewModel.count ?? Int(Double.nan))
        titleLabel.text = viewModel.entity?.title
    }
    
    struct ViewModel {
        let count: Int?
        let entity: Entity?
    }
    
}

extension RelationCountCollectionViewCell: StructureIdentifiable & NibInitializable { }

private extension Entity {
    
    var icon: UIImage? {
        switch self {
        case .characters: assertionFailure("Characters icon has not been designed"); return nil
        case .comics: return #imageLiteral(resourceName: "Icon-Comics")
        case .creators: assertionFailure("Creators icon has not been designed"); return nil
        case .events: return #imageLiteral(resourceName: "Icon-Events")
        case .series: return #imageLiteral(resourceName: "Icon-Series")
        case .stories: return #imageLiteral(resourceName: "Icon-Stories")
        }
    }
}
