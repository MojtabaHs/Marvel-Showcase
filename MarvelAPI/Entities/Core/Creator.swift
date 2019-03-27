//
//  Creator.swift
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
    
    public struct Creator: EntityType {

        /// The unique ID of the creator resource.
        public let id: Int?

        /// The first name of the creator.
        public let firstName: String?

        /// The middle name of the creator.
        public let middleName: String?

        /// The last name of the creator.
        public let lastName: String?

        /// The suffix or honorific for the creator.
        public let suffix: String?

        /// The full name of the creator (a space-separated concatenation of the above four fields).
        public let fullName: String?

        /// The date the resource was most recently modified.
        public let modified: Foundation.Date?

        /// The canonical URL identifier for this resource.
        public let resourceURI: String?

        /// A set of public web site URLs for the resource.
        public let urls: [Entity.Common.URL]?

        /// The representative image for this creator.
        public let thumbnail: Entity.Common.Image?

        /// A resource list containing the series which feature work by this creator.
        public let series: Entity.Core.Series.List?

        /// A resource list containing the stories which feature work by this creator.
        public let stories: Entity.Core.Story.List?

        /// A resource list containing the comics which feature work by this creator.
        public let comics: Entity.Core.Comic.List?

        /// A resource list containing the events which feature work by this creator.
        public let events: Entity.Core.Event.List?
    }
    
}

public extension Entity.Core.Creator {
    
    public struct Summary: EntitySummary {
        
        /// The path to the individual creator resource.
        public let resourceURI: String?
        
        /// The full name of the creator.
        public let name: String?
        
        /// The role of the creator in the parent entity.
        public let role: String?
    }
    
}

public extension Entity.Core.Creator {
    
    public struct List: ResourceList {
        
        /// The number of total available creators in this list. Will always be greater than or equal to the "returned" value.
        public let available: Int?
        
        /// The number of creators returned in this collection (up to 20).
        public let returned: Int?
        
        /// The path to the full list of creators in this collection.
        public let collectionURI: String?
        
        /// The list of returned creators in this collection.
        public let items: [Summary]?
    }
    
}
