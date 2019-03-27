//
//  WebserviceManager.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/23/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import WebserviceHandler

public class WebserviceManager: WebserviceHandler.WebserviceManager {
    
    var urlParametersEncoder = JSONEncoder()
    
    public func resumeDataTask<T: HTTPRequestRouter>(
        router: T,
        completion: @escaping (T.Result?) -> Void) throws -> URLSessionDataTask  {
        
        return try super.resumeDataTask(urlRequestable: router, success: completion, failure: { decodable, error in
            completion(decodable)
        })
    }
}

public extension WebserviceManager {
    
    public static let shared: WebserviceManager = {
        let requestManager = RequestManager.default
        
        requestManager.urlRequestAdapters = [
            RequestAuthenticationAdapter.cachableShared,
            RequestCachingAdapter.default
        ]
        
        let responseManager = ResponseManager.default
        responseManager.responseAdapters = [NonHTTPResponseResponseAdapter.shared]
        
        let webserviceManager = WebserviceManager(
            requestHandler: requestManager,
            responseHandler: responseManager
        )
        
        return webserviceManager
    }()
}

extension HTTPRequestRouter {
    public var urlParametersEncoder: JSONEncoder {
        return WebserviceManager.shared.urlParametersEncoder
    }
}
