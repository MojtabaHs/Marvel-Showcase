//
//  Character.swift
//  MarvelAPI
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/22/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation

public extension Entity.Core {
    
    public struct Character: EntityType {
        
        /// The unique ID of the character resource.
        public let id: Int?
        
        /// The name of the character.
        public let name: String?
        
        /// A short bio or description of the character.
        public let description: String?
        
        /// The date the resource was most recently modified.
        public let modified: Foundation.Date?
        
        /// The canonical URL identifier for this resource.
        public let resourceURI: String?
        
        /// A set of public web site URLs for the resource.
        public let urls: [Entity.Common.URL]?
        
        /// The representative image for this character.
        public let thumbnail: Entity.Common.Image?
        
        /// A resource list containing comics which feature this character.
        public let comics: Entity.Core.Comic.List?
        
        /// A resource list of stories in which this character appears.
        public let stories: Entity.Core.Story.List?
        
        /// A resource list of events in which this character appears.
        public let events: Entity.Core.Event.List?
        
        /// A resource list of series in which this character appears.
        public let series: Entity.Core.Series.List?
        
    }
    
}

public extension Entity.Core.Character {
    
    public struct List: ResourceList {
        
        /// The number of total available characters in this list. Will always be greater than or equal to the "returned" value.
        public let available: Int?
        
        /// The number of characters returned in this collection (up to 20).
        public let returned: Int?
        
        /// The path to the full list of characters in this collection.
        public let collectionURI: String?
        
        /// The list of returned characters in this collection.
        public let items: [Summary]?
    }
    
}

public extension Entity.Core.Character {
    
    public struct Summary: EntitySummary {
        
        /// The path to the individual character resource.
        public let resourceURI: String?
        
        /// The full name of the character.
        public let name: String?
        
        /// The role of the creator in the parent entity.
        public let role: String?
    }
    
}
