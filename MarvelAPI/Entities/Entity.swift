//
//  Entity.swift
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

/// Entities returned by the API will have two representations: a full view and a summary view. The full view is returned by requests to a resource endpoint, and summaries are returned when a resource is referenced by a full resource. For example, a call to the comics endpoint http://gateway.marvel.com/v1/public/comics returns full views of comics and summaries of other entities such as creators which created the comic, characters which appear in it and the series in which the comic belongs.
public enum Entity {
    
    /// Many entity type returned by an endpoint will have components which have a common structure.
    public enum Common { }
    
    /// Each entity type returned by an endpoint has a distinct structure
    public enum Core { }
}

/// Summary views will always contain a resourceURI, which points to the full representation of the referenced entity, and a name, for convenience. Some summary representations will additionally have a field describing its type or the relationship between the returned entity and the referenced entity.
public protocol EntitySummary: Decodable & Equatable {
    
    /// The canonical URL identifier for this resource.
    var resourceURI: String? { get }
    
    /// The name of this resource.
    var name: String? { get }
}

/// Every entity (either common or core) is an EntityType. Since Marvel-API only supports GET method, All entities should be decodable.
public protocol EntityType: Decodable & Equatable { }
