//
//  NonHTTPResponseAdapter.swift
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

class NonHTTPResponseResponseAdapter: WebserviceHandler.ResponseAdapter {
    
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
        let urlLoadingSystemErrorCodesDocumentationPath = "https://developer.apple.com/documentation/foundation/1508628-url_loading_system_error_codes"
        let adaptedResponse = HTTPURLResponse(url: URL(string: urlLoadingSystemErrorCodesDocumentationPath)!,
                                       statusCode: nsError.code,
                                       httpVersion: nil,
                                       headerFields: nil)
        
        return (adaptedData, adaptedResponse, nil)
    }
    
}

extension NonHTTPResponseResponseAdapter {
    
    static let shared = NonHTTPResponseResponseAdapter()
}
