//
//  Entity.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/27/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import Foundation
import MarvelAPI

enum Entity: String, CaseIterable {
    case characters
    case comics
    case creators
    case events
    case series
    case stories
    
    var title: String {
        return self.rawValue
    }
}

// MARK: - Convenience extension for maping data with UI.
extension MarvelAPI.Entity.Core.Character {
    
    func availableItemsCount(for entity: Entity) -> Int? {
        switch entity {
        case .characters: return nil
        case .comics: return comics?.available
        case .creators: return nil
        case .events: return events?.available
        case .series: return series?.available
        case .stories: return stories?.available
        }
    }
}
