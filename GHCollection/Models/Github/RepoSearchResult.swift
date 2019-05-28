//
//  RepoSearchResult.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

struct RepoSearchResult: Codable, RepoSearchResultRepresenting {

    let total: Int
    /// Must be separated from `items`. Thanks to that, both `Codable` and `RepoSearchResultRepresenting` are conformed.
    let innerItems: [Repository]

    var items: [RepositoryRepresenting] {
        return innerItems
    }

    enum CodingKeys: String, CodingKey {
        case total = "total_count"
        case innerItems = "items"
    }

}
