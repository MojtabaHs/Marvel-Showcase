//
//  JSONEncoderExtension.swift
//  WebserviceHandler
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/22/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

public extension JSONEncoder {
    
    public func urlQueriItems<T: Encodable>(encodable: T) throws -> [URLQueryItem]? {
        let encoded = try encode(encodable)
        let josnObject = try JSONSerialization.jsonObject(with: encoded) as? [String: Any]
        return josnObject?.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
    }
}
