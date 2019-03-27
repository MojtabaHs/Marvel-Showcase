//
//  CharacterOverviewCollectionViewCell.swift
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

class CharacterOverviewCollectionViewCell: UICollectionViewCell {
    
    // TODO: Make this more reliable
    private lazy var characterOverviewView: CharacterOverviewView = {
        let characterOverviewView = CharacterOverviewView.nib!.instantiate(withOwner: self).first as! CharacterOverviewView
        characterOverviewView.frame = contentView.bounds
        characterOverviewView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(characterOverviewView)
        return characterOverviewView
    }()
    
    var character: MarvelAPI.Entity.Core.Character? {
        set { characterOverviewView.character = newValue }
        get { return characterOverviewView.character }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 24
        contentView.clipsToBounds = true
    }
}

extension CharacterOverviewCollectionViewCell: StructureIdentifiable { }
