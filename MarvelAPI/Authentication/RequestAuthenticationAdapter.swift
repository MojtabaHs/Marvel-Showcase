//
//  RequestAuthenticationAdapter.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/23/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation
import WebserviceHandler

class RequestAuthenticationAdapter: WebserviceHandler.URLRequestAdapter {
    
    init(authentication: Authentication) {
        self.authentication = authentication
    }
    
    private let authenticationEncoder = JSONEncoder()
    
    /// Authentication to access Marvel API.
    private let authentication: Authentication
    
    /// This adapter appends API-Key to any request that is about to send to the API.
    ///
    /// - Parameter urlRequest: Request that is about to send to the API.
    /// - Returns: Cloned request with API-Key appended to it.
    func adaptedURLRequest(from urlRequest: URLRequest) -> URLRequest {
        
        guard let url = urlRequest.url else {
            assertionFailure("URL not found")
            return urlRequest
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            assertionFailure("Invvalid URL: \(url)")
            return urlRequest
        }
        
        let originalRequestQueryItems = urlComponents.queryItems ?? []
        let authenticationQueryItems: [URLQueryItem]
        
        do {
             authenticationQueryItems = try authenticationEncoder.urlQueriItems(encodable: authentication) ?? []
        } catch {
            assertionFailure(error.localizedDescription)
            return urlRequest
        }

        let queryItems = originalRequestQueryItems + authenticationQueryItems
        urlComponents.queryItems = queryItems
        
        var adaptedRequest = urlRequest
        adaptedRequest.url = urlComponents.url
        
        return adaptedRequest
    }
}

extension RequestAuthenticationAdapter {
    
    static var bundle: Bundle { return Bundle(for: self) }
    
    /// API key is public and there is no need for encryption.
    static let shared: RequestAuthenticationAdapter = {
        
        let authentication = Authentication(
            privateKey: Secrets.privateKey,
            publicKey: Secrets.publicKey
        )
        
        return RequestAuthenticationAdapter(authentication: authentication)
    }()
}
