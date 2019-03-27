//
//  StoriesRouter.swift
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

public struct StoriesRouter {
    
    public typealias StoryDataContainer = Result<Entity.Core.Story>
    public static let resource = URL(string: "stories")!
    
    public static func resource(forId id: Int) -> URL {
        return resource.appendingPathComponent(String(id))
    }
    
    public enum Endpoint { }
}
