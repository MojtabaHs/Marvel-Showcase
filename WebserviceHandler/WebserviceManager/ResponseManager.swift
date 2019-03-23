//
//  ResponseManager.swift
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

open class ResponseManager: HTTPResponseHandler {
    
    public init(jsonParser: JSONParser) {
        self.jsonParser = jsonParser
    }
    
    open var jsonParser: JSONParser
}

extension ResponseManager {
    
    public static let `default`: ResponseManager = ResponseManager(jsonParser: JSONParsingManager.default)
}
