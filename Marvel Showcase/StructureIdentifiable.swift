//
//  NibIdentifiable.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/27/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

protocol StructureIdentifiable {
    static var identifier: String { get }
}

extension StructureIdentifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
