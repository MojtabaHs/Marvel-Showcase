//
//  Secrets.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/23/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

enum Secrets {
    
    #if DEBUG
    #warning("This private key is only for testing and may not be available later. Consider using yours")
    static let privateKey: String = "24f144b53deb7afbbf2cc1281448eaac11f4caaa"
    #warning("This public key is only for testing and may not be available later. Consider using yours")
    static let publicKey: String = "30e1adbecefe3f9d15d09877ca4075c7"
    #else
    
    static let privateKey: String    
    static let publicKey: String
    #endif
}
