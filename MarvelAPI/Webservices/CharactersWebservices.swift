//
//  CharactersWebservices.swift
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

public extension CharactersRouter.Endpoint.Characters {
    
    public static func get(nameStartsWith namePrefix: String? = nil,
                           limit: Int? = nil,
                           offset: Int? = nil,
                           success: @escaping ([Entity.Core.Character]?) -> Void,
                           failure: @escaping (Result.Error) -> Void) throws -> URLSessionDataTask {
        
        let urlParameters = URLParameters(nameStartsWith: namePrefix,
                                          limit: limit,
                                          offset: offset)
        
        let router = CharactersRouter.Endpoint.Characters(urlParameters: urlParameters)
        return try WebserviceManager.shared.resumeDataTask(router: router) { result in
            guard let result = result else { return assertionFailure("Unknown response")}
            
            switch result {
            case .success(let wrapper):
                let characters = wrapper.data?.results
                success(characters)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    public func get(success: @escaping ([Entity.Core.Character]?) -> Void,
                    failure: @escaping (Result.Error) -> Void) throws -> URLSessionDataTask {
        
        return try WebserviceManager.shared.resumeDataTask(router: self) { result in
            guard let result = result else { return assertionFailure("Unknown response")}
            
            switch result {
            case .success(let wrapper):
                let characters = wrapper.data?.results
                success(characters)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
}
