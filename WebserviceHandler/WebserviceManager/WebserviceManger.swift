//
//  WebserviceManger.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/23/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

open class WebserviceManager: HTTPWebserviceHandler {
    
    public init(requestHandler: HTTPRequestHandler, responseHandler: HTTPResponseHandler) {
        self.requestHandler = requestHandler
        self.responseHandler = responseHandler
    }
    
    open var requestHandler: HTTPRequestHandler
    open var responseHandler: HTTPResponseHandler
    
    open func request<T: Decodable, U: Decodable>(
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

public extension WebserviceManager {
    
    public static let `default` = WebserviceManager(
        requestHandler: RequestManager.default,
        responseHandler: ResponseManager.default
    )
}
