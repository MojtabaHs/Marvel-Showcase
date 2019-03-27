//
//  EventsOfCharacterWebservices.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/24/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

public extension CharactersRouter.Endpoint.EventsOfCharacter {
    
    public static func get(characterId: Int,
                           limit: Int? = nil,
                           offset: Int? = nil,
                           success: @escaping (Result.Container<Entity.Core.Event>?) -> Void,
                           failure: @escaping (Result.Error) -> Void) throws -> URLSessionDataTask {
        
        let urlParameters = URLParameters(limit: limit,
                                          offset: offset)
        
        let router = CharactersRouter.Endpoint.EventsOfCharacter(id: characterId,
                                                                 urlParameters: urlParameters)
        
        return try WebserviceManager.shared.resumeDataTask(router: router) { result in
            guard let result = result else { return assertionFailure("Unknown response")}
            
            switch result {
            case .success(let wrapper):
                success(wrapper.data)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    public func get(success: @escaping (Result.Container<Entity.Core.Event>?) -> Void,
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
