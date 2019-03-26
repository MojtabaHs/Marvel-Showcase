//
//  StoriesOfCharacterEndpoint.swift
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
    
    public struct StoriesOfCharacter: HTTPRequestRouter {
        public typealias Result = StoriesRouter.StoryDataContainer
        
        public let id: Int
        
        public var path: String { return CharactersRouter.resource(forId: id).appendingPathComponent("stories").absoluteString }
        
        public var urlParameters: URLParameters?
        
        // Mark: - Public initializer
        public init(id: Int, urlParameters: URLParameters?) {
            self.id = id
            self.urlParameters = urlParameters
        }
    }
    
}

public extension CharactersRouter.Endpoint.StoriesOfCharacter {
    
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

// Swift bug forced us to put this extension in the same file
// TODO: Move coresponding extesntion here after swift bug fixed
public extension CharactersRouter.Endpoint.StoriesOfCharacter {
    
    public func get(characterId: Int,
                    limit: Int? = nil,
                    offset: Int? = nil,
                    success: @escaping (Entity.Core.Story?) -> Void,
                    failure: @escaping (Result.Error) -> Void) throws -> URLSessionDataTask {
        
        let urlParameters = URLParameters(limit: limit,
                                          offset: offset)
        
        let router = CharactersRouter.Endpoint.StoriesOfCharacter(id: characterId,
                                                                  urlParameters: urlParameters)
        
        return try WebserviceManager.shared.resumeDataTask(router: router) { result in
            guard let result = result else { return assertionFailure("Unknown response")}
            
            switch result {
            case .success(let wrapper):
                let character = wrapper.data?.results?.first
                success(character)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
}
