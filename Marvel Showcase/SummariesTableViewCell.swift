//
//  SummariesTableViewCell.swift
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

class SummariesTableViewCell: UITableViewCell {
    
    static let height: CGFloat = 256
    
    var rootId: Int? {
        didSet {
            guard let id = rootId else { return }
            guard id != oldValue else { return }
            getSummaries(id: id)
        }
    }
    
    var viewModel: ViewModel? { didSet { setupData() } }
    var request: URLRequest?

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var countLabelContainer: UIView!
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    struct ViewModel {
        let entity: Entity
        let count: Int?
        let description: String?
    }
    
    func getSummaries(id: Int) {
        fatalError("Not implemented")
    }
    
    private func setupData() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.entity.title.firstCapitalized
        if let count = viewModel.count {
            countLabel.text = String(count)
        } else {
            countLabel.text = "-"
        }
        subtitleLabel.text = viewModel.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countLabelContainer.layer.cornerRadius = countLabelContainer.frame.height.devided(by: 2)
    }
}

extension SummariesTableViewCell: NibInitializable { }
