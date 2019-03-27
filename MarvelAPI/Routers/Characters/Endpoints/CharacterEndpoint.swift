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

// Swift bug forced us to put this extension in the same file
// TODO: Move coresponding extesntion here after swift bug fixed
public extension CharactersRouter.Endpoint.Character {
    
    public static func get(characterId: Int,
                           success: @escaping (Entity.Core.Character?) -> Void,
                           failure: @escaping (Result.Error) -> Void) throws -> URLSessionDataTask {
        
        let router = CharactersRouter.Endpoint.Character(id: characterId)
        return try WebserviceManager.shared.resumeDataTask(router: router) { result in
            guard let result = result else { return assertionFailure("Unknown response")}
            
            switch result {
            case .success(let wrapper):
                success(wrapper.data?.results?.first)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    public func get(success: @escaping (Result.Container<Entity.Core.Character>?) -> Void,
                    failure: @escaping (Result.Error) -> Void) throws -> URLSessionDataTask {
        
        return try WebserviceManager.shared.resumeDataTask(router: self) { result in
            guard let result = result else { return assertionFailure("Unknown response")}
            
            switch result {
            case .success(let wrapper):
                success(wrapper.data)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
}
