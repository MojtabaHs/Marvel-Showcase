//
//  Encrypter.swift
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
import CommonCrypto

struct Hasher {
    
    static func md5Data(rawString: String) -> Data {
        let messageData = rawString.data(using:.utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes { digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        return digestData
    }
    
    static func md5Hex(of rawString: String) -> String {
        let md5Data = self.md5Data(rawString: rawString)
        return md5Data.map { String(format: "%02hhx", $0) }.joined()
    }
    
}
