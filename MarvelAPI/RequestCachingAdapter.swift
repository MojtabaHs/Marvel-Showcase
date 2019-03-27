//
//  RequestCachingAdapter.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/27/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation
import WebserviceHandler

public class RequestCachingAdapter: WebserviceHandler.URLRequestAdapter {
    
    public init(cachePolicy: URLRequest.CachePolicy) {
        self.cachePolicy = cachePolicy
    }
    
    let cachePolicy: URLRequest.CachePolicy
    
    public func adaptedURLRequest(from urlRequest: URLRequest) -> URLRequest {
        
        var adaptedURLRequest = urlRequest
            adaptedURLRequest.cachePolicy = cachePolicy
        
        return adaptedURLRequest
    }
}

public extension RequestCachingAdapter {
    
    static let `default` = RequestCachingAdapter(cachePolicy: .returnCacheDataElseLoad)
}
