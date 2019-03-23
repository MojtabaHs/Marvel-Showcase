//
//  HTTPWebserviceHandler.swift
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

public protocol HTTPWebserviceHandler {
    
    var requestHandler: HTTPRequestHandler { get }
    var responseHandler: HTTPResponseHandler { get }
    
    func resumeDataTask<T: Decodable, U: Decodable>(
        urlRequestable: URLRequestable,
        success: @escaping (T?) -> Void,
        failure: @escaping (U?, Error?) -> Void) throws -> URLSessionDataTask
}

public extension HTTPWebserviceHandler {
    
    func resumeDataTask<T: Decodable, U: Decodable>(
        urlRequestable: URLRequestable,
        success: @escaping (T?) -> Void = { _ in },
        failure: @escaping (U?, Error?) -> Void = { _,_ in }) throws -> URLSessionDataTask {
        
        return try requestHandler.resumeDataTask(
            urlRequestable: urlRequestable,
            completionHandler: { (data, response, error) in
                self.responseHandler.handleResponse(data: data, response: response, error: error, success: success, failure: failure)
        })
    }
}
