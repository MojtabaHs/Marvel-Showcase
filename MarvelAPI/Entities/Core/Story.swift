//
//  Story.swift
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
    
    public struct Story: EntityType {
        
        /// The unique ID of the story resource.
        public let id: Int?
        
        /// The story title.
        public let title: String?
        
        /// A short description of the story.
        public let description: String?
        
        /// The canonical URL identifier for this resource.
        public let resourceURI: String?
        
        /// The story type e.g. Interior story, cover, text story.
        public let type: String?
        
        /// The date the resource was most recently modified.
        public let modified: Foundation.Date?
        
        /// The representative image for this story.
        public let thumbnail: Entity.Common.Image?
        
        /// A resource list containing comics in which this story takes place.
        public let comics: Comic.List?
        
        /// A resource list containing series in which this story appears.
        public let series: Series.List?
        
        /// A resource list of the events in which this story appears.
        public let events: Event.List?
        
        /// A resource list of characters which appear in this story.
        public let characters: Character.List?
        
        /// A resource list of creators who worked on this story.
        public let creators: Creator.List?
        
        /// A summary representation of the issue in which this story was originally published.
        public let originalissue: Comic.Summary?
    }
    
}

public extension Entity.Core.Story {
    
    public struct List: ResourceList {
        
        /// The number of total available stories in this list. Will always be greater than or equal to the "returned" value.
        public let available: Int?
        
        /// The number of stories returned in this collection (up to 20).
        public let returned: Int?
        
        /// The path to the full list of stories in this collection.
        public let collectionURI: String?
        
        /// The list of returned stories in this collection.
        public let items: [Summary]?
    }
    
}

public extension Entity.Core.Story {
    
    public struct Summary: EntitySummary {
        
        /// The path to the individual story resource.,
        public let resourceURI: String?
        
        /// The canonical name of the story.,
        public let name: String?
        
        /// The type of the story (interior or cover).
        public let type: String?
    }
    
}
