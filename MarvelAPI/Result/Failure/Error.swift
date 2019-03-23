//
//  Error.swift
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

    /// If a call to an API endpoint fails, the API will return an error object.
    ///
    /// The API will also send an HTTP status code equal to the code attribute of the returned error object.
    public struct Error: Decodable & Equatable {
        
        /// The http status code of the error
        public let code: Int?
        /// A description of the error
        public let status: String?
    }
    
}
