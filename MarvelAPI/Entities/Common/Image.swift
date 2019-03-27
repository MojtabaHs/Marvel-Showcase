//
//  Image.swift
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

extension Entity.Common {
    
    /// Images are represented as a partial path and an extension.
    public struct Image: EntityType {
        
        /// The directory path of to the image.
        public let path: String?
        
        /// The file extension for the image.
        public let `extension`: String?
    }
    
}

// MARK: - Convenience extension for Image
public extension Entity.Common.Image {
    
    /// Convenience variable for downloading image url.
    var url: URL? {
        guard let path = path else { return nil }
        guard let `extension` = `extension` else { return nil }
        
        return URL(string: path + `extension`)
    }
}
