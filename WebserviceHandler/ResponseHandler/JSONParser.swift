//
//  JSONParser.swift
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

public protocol JSONParser {
    var jsonDecoder: JSONDecoder { get }
    func parseData<T: Decodable>(_ data: Data, to: T.Type) throws -> T
}
