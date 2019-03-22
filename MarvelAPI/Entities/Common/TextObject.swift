//
//  TextObject.swift
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
    
    /// Text objects are bits of descriptive text which are attached to an entity.
    public struct TextObject: EntityType {
        
        /// The string description of the text object (e.g. solicit text, preview text, etc.).
        public let type: String?
        
        /// A language code denoting which language the text object is written in.
        public let language: String?
        
        /// The text of the text object.
        public let text: String?
    }
    
}
