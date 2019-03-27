//
//  CharactersEndpoint.swift
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

public extension CharactersRouter.Endpoint {
    
    public struct Characters: HTTPRequestRouter {
        public typealias Result = CharactersRouter.CharacterDataContainer
        
        public var path: String { return CharactersRouter.resource.absoluteString }
        
        public var urlParameters: URLParameters?
        
        // Mark: - Public initializer
        public init(urlParameters: URLParameters?) {
            
            self.urlParameters = urlParameters
        }
    }
    
}

public extension CharactersRouter.Endpoint.Characters {
    
    public struct URLParameters: Encodable, Paginatable {
        public let nameStartsWith: String?
        public let limit: Int?
        public let offset: Int?
        
        // TODO: Add other parameters
        
        public init(nameStartsWith: String?,
                    limit: Int?,
                    offset: Int?) {
            
            self.nameStartsWith = nameStartsWith
            self.limit = limit
            self.offset = offset
        }
    }
    
}
