//
//  HTTPRequestHandler.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/22/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

public protocol URLRequestAdapter {
    func adaptedURLRequest(from urlRequest: URLRequest) -> URLRequest
}

public protocol HTTPRequestHandler {
    var urlSession: URLSession { get }
    var urlRequestAdapters: [URLRequestAdapter] { get }
    func resumeDataTask(urlRequestable: URLRequestable, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) throws -> URLSessionDataTask
}

public extension HTTPRequestHandler {
    public var urlRequestAdapters: [URLRequestAdapter] { return [] }
    
    public func resumeDataTask(urlRequestable: URLRequestable, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) throws -> URLSessionDataTask {
        
        let originalURLRequest = try urlRequestable.urlRequest()
        
        var adaptedURLRequest: URLRequest?
        for adapter in urlRequestAdapters {
            adaptedURLRequest = adapter.adaptedURLRequest(from: originalURLRequest)
        }
        
        let request = adaptedURLRequest ?? originalURLRequest
        
        let task = urlSession.dataTask(
            with: request,
            completionHandler: completionHandler
        )
        task.resume()
        
        return task
    }
}
