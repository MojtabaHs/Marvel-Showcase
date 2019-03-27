//
//  NoneHTTPResponseAdapter.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/27/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import WebserviceHandler

class NoneHTTPResponseResponseAdapter: WebserviceHandler.HTTPResponseAdapter {
    
    private let jsonEncoder = JSONEncoder()
    
    func adaptedResponse(data: Data?, response: URLResponse?, error: Error?) -> (data: Data?, response: URLResponse?, error: Error?) {
        
        let originalResponse = (data, response, error)
        
        guard let error = error else { return originalResponse }
        let nsError = error as NSError
        
        guard !(100..<599).contains(nsError.code) else { return originalResponse }
        
        let adaptedError = Result<DontCareEntity>.Error(
            code: nsError.code,
            status: nsError.localizedDescription
        )
        
        let adaptedData = try! jsonEncoder.encode(adaptedError)
        return (adaptedData, response, error)
    }
    
}

extension NoneHTTPResponseResponseAdapter {
    
    static let shared = NoneHTTPResponseResponseAdapter()
}
