//
//  CreatorsRouter.swift
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

public struct CreatorsRouter {
    
    public typealias CreatorDataContainer = Result<Entity.Core.Creator>
    public static let resource = URL(string: "creators")!
    
    public static func resource(forId id: Int) -> URL {
        return resource.appendingPathComponent(String(id))
    }
    
    public enum Endpoint { }
}
