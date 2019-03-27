//
//  HttpRequestRouter.swift
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

public protocol HTTPRequestRouter: WebserviceHandler.HTTPRequestRouter { }
public extension HTTPRequestRouter {
    public var baseURL: URL { return URL(string: "https://gateway.marvel.com/v1/public")! }
}

public protocol Paginatable: Encodable {
    var limit: Int? { get }
    var offset: Int? { get }
}
