//
//  ResourceList.swift
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

/// Resource lists are collections of summary views within the context of another entity type. For example, the list of creators attached to a comic would be presented as resource list inside the full representation of that comic.
public protocol ResourceList: EntityType {
    
    associatedtype T: EntitySummary
    
    /// The number of total available resources in this list
    var available: Int? { get }
    
    /// The number of resources returned in this resource list (up to 20).
    var returned: Int? { get }
    
    /// The path to the list of full view representations of the items in this resource list.
    var collectionURI: String? { get }
    
    /// A list of summary views of the items in this resource list.
    var items: [T]? { get }
}
