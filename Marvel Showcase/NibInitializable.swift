//
//  NibInitializable.swift
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

protocol NibInitializable {
    static var nib: UINib? { get }
}

extension NibInitializable {
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: .main)
    }
}
