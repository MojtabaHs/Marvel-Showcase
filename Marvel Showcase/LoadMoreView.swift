//
//  LoadMoreView.swift
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

class LoadMoreView: UICollectionReusableView {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func startLoading(description: String? = nil) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        descriptionLabel.text = description
        descriptionLabel.isHidden = descriptionLabel.text?.isEmpty != false
    }
    
    func stopLoading(description: String? = nil) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        descriptionLabel.text = description
        descriptionLabel.isHidden = descriptionLabel.text?.isEmpty != false
    }
    
}

extension LoadMoreView: NibInitializable & StructureIdentifiable { }
