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
    var urlResponseAdapters: [ResponseAdapter] { get }
    func handleResponse<T: Decodable, U: Decodable>(data: Data?, response: URLResponse?, error: Error?, success: @escaping (T?) -> Void, failure: @escaping (U?, Error?) -> Void)
}
