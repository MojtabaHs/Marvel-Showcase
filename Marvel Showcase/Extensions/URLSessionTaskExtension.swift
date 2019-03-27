//
//  URLSessionTaskExtension.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/27/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

extension URLSessionTask {
    var isActive: Bool {
        switch state {
        case .running: return true
        case .suspended: return false
        case .canceling: return false // It is not active logically
        case .completed: return false
        }
    }
}
