//
//  HTTPResponseHandler.swift
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

public protocol ResponseAdapter {
    func adaptedResponse(data: Data?, response: URLResponse?, error: Error?) -> (data: Data?, response: URLResponse?, error: Error?)
}

public protocol HTTPResponseHandler {
    var jsonParser: JSONParser { get }
    var responseAdapters: [ResponseAdapter] { get }
    func handleResponse<T: Decodable, U: Decodable>(data: Data?, response: URLResponse?, error: Error?, success: @escaping (T?) -> Void, failure: @escaping (U?, Error?) -> Void)
}

public extension HTTPResponseHandler {
    
    public var responseAdapters: [ResponseAdapter] { return [] }
    
    public func handleResponse<T: Decodable, U: Decodable>(data: Data?, response: URLResponse?, error: Error?, success: @escaping (T?) -> Void, failure: @escaping (U?, Error?) -> Void) {
        
        let originalResponse = (data: data, response: response, error: error)
        
        var adaptedResponse = originalResponse
        for adapter in responseAdapters {
            adaptedResponse = adapter.adaptedResponse(data: data, response: response, error: error)
        }
        
        // Mark: Adapt and check error
        let error = adaptedResponse.error
        guard error == nil else { return failure(nil, error) }

        // Mark: Adapt and check response
        let response = adaptedResponse.response
        guard let httpResponse = response as? HTTPURLResponse else { return failure(nil, error) }
        
        // Mark: Adapt and check data
        let data = adaptedResponse.data
        var isSuccess: Bool { return (100..<400).contains(httpResponse.statusCode) }
        guard let reponseData = data else { return isSuccess ? success(nil) : failure(nil, nil) }

        do {
            if isSuccess {
                let result = try jsonParser.parseData(reponseData, to: T.self)
                return success(result)
            } else {
                let result = try jsonParser.parseData(reponseData, to: U.self)
                return failure(result, error)
            }
        } catch {
            return failure(nil, error)
        }
        
    }
}
