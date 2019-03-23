//
//  CharacterEndpoint.swift
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
    
    public struct Character: HTTPRequestRouter {
        public typealias Result = CharactersRouter.CharacterDataContainer
        
        public let id: Int
        
        public var path: String { return CharactersRouter.resource(forId: id).absoluteString }
        
        public struct URLParameters: Encodable { }
        
        public let urlParameters: URLParameters? = nil
        
        // Mark: - Public initializer
        public init(id: Int) {
            
            self.id = id
        }
    }

}
