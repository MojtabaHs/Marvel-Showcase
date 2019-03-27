//
//  Comic.swift
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
    
    public struct Comic: EntityType {

        /// The unique ID of the comic resource.
        public let id: Int?

        /// The ID of the digital comic representation of this comic. Will be 0 if the comic is not available digitally.
        public let digitalId: Int?

        /// The canonical title of the comic.
        public let title: String?

        /// The number of the issue in the series (will generally be 0 for collection formats).
        public let issueNumber: Int?

        /// If the issue is a variant (e.g. an alternate cover, second prInting, or director's cut), a text description of the variant.
        public let variantDescription: String?

        /// The preferred description of the comic.
        public let description: String?

        /// The date the resource was most recently modified.
        public let modified: Foundation.Date?

        /// The ISBN for the comic (generally only populated for collection formats).
        public let isbn: String?

        /// The UPC barcode number for the comic (generally only populated for periodical formats).
        public let upc: String?

        /// The Diamond code for the comic.
        public let diamondCode: String?

        /// The EAN barcode for the comic.
        public let ean: String?

        /// The ISSN barcode for the comic.
        public let issn: String?

        /// The publication format of the comic e.g. comic, hardcover, trade paperback.
        public let format: String?

        /// The number of story pages in the comic.
        public let pageCount: Int?

        /// A set of descriptive text blurbs for the comic.
        public let textObjects: [Entity.Common.TextObject]?

        /// The canonical URL identifier for this resource.
        public let resourceURI: String?

        /// A set of public web site URLs for the resource.
        public let urls: [Entity.Common.URL]?

        /// A summary representation of the series to which this comic belongs.
        public let series: Series.Summary?

        /// A list of variant issues for this comic (includes the "original" issue if the current issue is a variant).
        public let variants: [Comic.Summary]?

        /// A list of collections which include this comic (will generally be empty if the comic's format is a collection).
        public let collections: [Comic.Summary]?

        /// A list of issues collected in this comic (will generally be empty for periodical formats such as "comic" or "magazine").
        public let collectedIssues: [Comic.Summary]?

        /// A list of key dates for this comic.
        public let dates: [Date]?

        /// A list of prices for this comic.
        public let prices: [Price]?

        /// The representative image for this comic.
        public let thumbnail: Entity.Common.Image?

        /// A list of promotional images associated with this comic.
        public let images: [Entity.Common.Image]?

        /// A resource list containing the creators associated with this comic.
        public let creators: Entity.Core.Creator.List?

        /// A resource list containing the characters which appear in this comic.
        public let characters: Entity.Core.Character.List?

        /// A resource list containing the stories which appear in this comic.
        public let stories: Entity.Core.Story.List?

        /// A resource list containing the events in which this comic appears.
        public let events: Entity.Core.Event.List?
    }
    
}

public extension Entity.Core.Comic {
    
    public struct List: ResourceList {
        
        /// The number of total available issues in this list. Will always be greater than or equal to the "returned" value.
        public let available: Int?
        
        /// The number of issues returned in this collection (up to 20).
        public let returned: Int?
        
        /// The path to the full list of issues in this collection.
        public let collectionURI: String?
        
        /// The list of returned issues in this collection.
        public let items: [Summary]?
    }
    
}

public extension Entity.Core.Comic {
    
    public struct Summary: EntitySummary {
        
        /// The path to the individual comic resource.
        public let resourceURI: String?
        
        /// The canonical name of the comic.
        public let name: String?
    }
    
}

public extension Entity.Core.Comic {
    
    public struct Date: Decodable & Equatable {
        
        /// A description of the date (e.g. onsale date, FOC date).
        public let type: String?
        
        /// The date.
        public let date: Foundation.Date?
    }
    
}

public extension Entity.Core.Comic {
    
    public struct Price: Decodable & Equatable {
        
        /// A description of the price (e.g. print price, digital price).
        public let type: String?
        
        /// The price (all prices in USD).
        public let price: Float?
    }
    
}
