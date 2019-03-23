//
//  Result.swift
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

/// Results returned by the API endpoints have the same general format, no matter which entity type the endpoint returns.
public enum Result<T: EntityType> {
    
    ///  Every successful call will return a wrapper object, which contains metadata and container object.
    case success(Wrapper<T>)
    
    /// If a call to an API endpoint fails, the API will return an error object.
    case failure(Error)
}

extension Result: Decodable & Equatable {
    
    private enum CodingKeys: String, CodingKey {
        case code
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let code = try values.decode(Int.self, forKey: .code)
        
        var isSuccess: Bool {
            return (100..<400).contains(code)
        }
        
        if isSuccess {
            let wrapper = try container.decode(Wrapper<T>.self)
            self = .success(wrapper)
        } else {
            let error = try container.decode(Error.self)
            self = .failure(error)
        }
    }
}
