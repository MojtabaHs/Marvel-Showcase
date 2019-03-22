//
//  Event.swift
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
    
    public struct Event: EntityType {

        /// The unique ID of the event resource.
        public let id: Int?

        /// The title of the event.
        public let title: String?

        /// A description of the event.
        public let description: String?

        /// The canonical URL identifier for this resource.
        public let resourceURI: String?

        /// A set of public web site URLs for the event.
        public let urls: [URL]?

        /// The date the resource was most recently modified.
        public let modified: Foundation.Date?

        /// The date of publication of the first issue in this event.
        public let start: Foundation.Date?

        /// The date of publication of the last issue in this event.
        public let end: Foundation.Date?

        /// The representative image for this event.
        public let thumbnail: Entity.Common.Image?

        /// A resource list containing the comics in this event.
        public let comics: Entity.Core.Comic.List?

        /// A resource list containing the stories in this event.
        public let stories: Entity.Core.Story.List?

        /// A resource list containing the series in this event.
        public let series: Entity.Core.Series.List?

        /// A resource list containing the characters which appear in this event.
        public let characters: Entity.Core.Character.List?

        /// A resource list containing creators whose work appears in this event.
        public let creators: Entity.Core.Creator.List?

        /// A summary representation of the event which follows this event.
        public let next: Event.Summary?

        /// A summary representation of the event which preceded this event.
        public let previous: Event.Summary?
    }
    
}

public extension Entity.Core.Event {

    public struct List: ResourceList {
        
        /// The number of total available events in this list. Will always be greater than or equal to the "returned" value.
        public let available: Int?
        
        /// The number of events returned in this collection (up to 20).
        public let returned: Int?
        
        /// The path to the full list of events in this collection.
        public let collectionURI: String?
        
        /// The list of returned events in this collection.
        public let items: [Summary]?
    }
    
}

public extension Entity.Core.Event {
    
    public struct Summary: EntitySummary {
        
        /// The path to the individual event resource.
        public let resourceURI: String?
        
        /// The name of the event.
        public let name: String?
    }
    
}
