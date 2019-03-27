//
//  EventsOfCharacterEndpoint.swift
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
    
    public struct EventsOfCharacter: HTTPRequestRouter {
        public typealias Result = EventsRouter.EventDataContainer
        
        public let id: Int
        
        public var path: String { return CharactersRouter.resource(forId: id).appendingPathComponent("events").absoluteString }
        
        public var urlParameters: URLParameters?
        
        // Mark: - Public initializer
        public init(id: Int, urlParameters: URLParameters?) {
            self.id = id
            self.urlParameters = urlParameters
        }
    }
    
}

public extension CharactersRouter.Endpoint.EventsOfCharacter {
    
    public struct URLParameters: Encodable, Paginatable {
        public let limit: Int?
        public let offset: Int?
        
        // TODO: Add other parameters
        
        public init(limit: Int?,
                    offset: Int?) {
            
            self.limit = limit
            self.offset = offset
        }
    }
    
}
