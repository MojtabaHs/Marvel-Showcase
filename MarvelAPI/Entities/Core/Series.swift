//
//  Series.swift
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
    
    public struct Series: EntityType {

        /// The unique ID of the series resource.
        public let id: Int?

        /// The canonical title of the series.
        public let title: String?

        /// A description of the series.
        public let description: String?

        /// The canonical URL identifier for this resource.
        public let resourceURI: String?

        /// A set of public web site URLs for the resource.
        public let urls: [URL]?

        /// The first year of publication for the series.
        public let startYear: Int?

        /// The last year of publication for the series (conventionally, 2099 for ongoing series).
        public let endYear: Int?

        /// The age-appropriateness rating for the series.
        public let rating: String?

        /// The date the resource was most recently modified.
        public let modified: Foundation.Date?

        /// The representative image for this series.
        public let thumbnail: Entity.Common.Image?

        /// A resource list containing comics in this series.
        public let comics: Entity.Core.Comic.List?

        /// A resource list containing stories which occur in comics in this series.
        public let stories: Entity.Core.Story.List?

        /// A resource list containing events which take place in comics in this series.
        public let events: Entity.Core.Event.List?

        /// A resource list containing characters which appear in comics in this series.
        public let characters: Entity.Core.Character.List?

        /// A resource list of creators whose work appears in comics in this series.
        public let creators: Entity.Core.Creator.List?

        /// A summary representation of the series which follows this series.
        public let next: Series.Summary?

        /// A summary representation of the series which preceded this series.
        public let previous: Series.Summary?
    }
    
}

public extension Entity.Core.Series {
    
    public struct List: ResourceList {
        
        /// The number of total available series in this list. Will always be greater than or equal to the "returned" value.
        public let available: Int?
        
        /// The number of series returned in this collection (up to 20).
        public let returned: Int?
        
        /// The path to the full list of series in this collection.
        public let collectionURI: String?
        
        /// The list of returned series in this collection.
        public let items: [Summary]?
    }
    
}

public extension Entity.Core.Series {
    
    public struct Summary: EntitySummary {
        
        /// The path to the individual series resource.
        public let resourceURI: String?
        
        /// The canonical name of the series.
        public let name: String?
    }
    
}
