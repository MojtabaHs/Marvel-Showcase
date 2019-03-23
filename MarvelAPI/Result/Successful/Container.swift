//
//  Container.swift
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

public extension Result {
    
    /// Container object displays pagination information and an array of the results returned by API call.
    public struct Container<T: EntityType>: Decodable & Equatable {
        
        /// The requested offset (skipped results) of the call.
        public let offset: Int?
        
        /// The requested result limit.
        public let limit: Int?
        
        /// The total number of results available.
        public let total: Int?
        
        /// The total number of results returned by this call.
        public let count: Int?
        
        /// The list of entities returned by the call.
        public let results: Array<T>?
    }
    
}
