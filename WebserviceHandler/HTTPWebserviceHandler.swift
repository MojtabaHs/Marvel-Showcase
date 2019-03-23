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
    
    func request<T: Decodable, U: Decodable>(
        urlRequestable: URLRequestable,
        success: @escaping (T?) -> Void,
        failure: @escaping (U?, Error?) -> Void) throws -> URLSessionDataTask
}
