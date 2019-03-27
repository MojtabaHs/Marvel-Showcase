//
//  Authentication.swift
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

class Authentication {
    
    init(privateKey: String, publicKey: String, staticTimestamp: Bool = false) {
        self.privateKey = privateKey
        self.publicKey = publicKey
        self.staticTimestamp = staticTimestamp
    }
    
    private let privateKey: String
    internal let publicKey: String
    
    /// Static timestamp can be use for request caching.
    ///
    /// Warning: Enabling this option allows attackers to requst server with your private and public keys without need to knowing it. So they can use your request limit.
    var staticTimestamp: Bool
    
    /// A timestamp (or other long string which can change on a request-by-request basis)
    var timestamp: String {
        return staticTimestamp ? "-1" : String(Date().timeIntervalSinceReferenceDate)
    }
    
    /// A md5 digest of the 'timestamp' parameter, 'private key' and 'public key'.
    func hash(timestamp: String) -> String {
        return Hasher.md5Hex(of: timestamp + privateKey + publicKey)
    }
}

extension Authentication: Encodable {
    
    enum CodingKeys: String, CodingKey {
        case ts
        case hash
        case apikey
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        let timestamp = self.timestamp
        
        try container.encode(hash(timestamp: timestamp), forKey: .hash)
        try container.encode(timestamp, forKey: .ts)
        try container.encode(publicKey, forKey: .apikey)
    }
}
