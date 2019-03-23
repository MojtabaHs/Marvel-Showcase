//
//  RequestManager.swift
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

open class RequestManager: HTTPRequestHandler {
    
    public init(urlSession: URLSession, urlRequestAdapters: [URLRequestAdapter] = []) {
        self.urlSession = urlSession
        self.urlRequestAdapters = urlRequestAdapters
    }
    
    open var urlSession: URLSession
    open var urlRequestAdapters: [URLRequestAdapter]
}

extension RequestManager {
    
    public static let `default` = RequestManager(urlSession: URLSession(configuration: .default))
}
