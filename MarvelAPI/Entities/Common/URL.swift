//
//  URL.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/22/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

public extension Entity.Common {
    
    /// URLs are references to web pages or deep links into applications. (When present in a resultset, it is preferred that you use these to link back to Marvel.) Many resources will have more than one representation on the web so URLs are generally presented as an array of URL resources.
    struct URL: EntityType {
        
        /// A text identifier for the URL.
        public let type: String?
        
        /// A full URL (including scheme, domain, and path).
        public let url: String?
    }
    
}
