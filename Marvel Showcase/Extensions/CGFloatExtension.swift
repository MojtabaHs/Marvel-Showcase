//
//  CGFloatExtension.swift
//  MarvelStar
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/23/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import UIKit

extension CGFloat {
    
    func devided(by value: Double) -> CGFloat {
        
        return self/CGFloat(value)
    }
    
    mutating func devide(by value: Double) {
        
        self = self.devided(by: value)
    }
}
