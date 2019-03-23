//
//  Wrapper.swift
//  MarvelStar
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/13/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

public extension Result {
    
    /// Wrapper object contains metadata about the call and a container object.
    public struct Wrapper<T: EntityType>: Decodable & Equatable {
        
        /// The HTTP status code of the returned result.
        public let code: Int?
        
        /// A string description of the call status.
        public let status: String?
        
        /// The results returned by the call.
        public let data: Container<T>?
        
        /// A digest value of the content.
        public let etag: String?
        
        /// The copyright notice for the returned result.
        public let copyright: String?
        
        /// The attribution notice for this result.
        public let attributionText: String?
        
        /// An HTML representation of the attribution notice for this result.
        public let attributionHTML: String?
    }
    
}
