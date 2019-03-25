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
    
    public func get(nameStartsWith namePrefix: String? = nil,
                    limit: Int? = nil,
                    offset: Int? = nil,
                    success: @escaping (Entity.Core.Character?) -> Void,
                    failure: @escaping (Result.Error) -> Void) throws -> URLSessionDataTask {
        
        let urlParameters = URLParameters(nameStartsWith: namePrefix,
                                          limit: limit,
                                          offset: offset)
        
        let router = CharactersRouter.Endpoint.Characters(urlParameters: urlParameters)
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
