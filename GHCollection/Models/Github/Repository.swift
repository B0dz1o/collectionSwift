//
//  Repository.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

struct Repository: Codable, RepositoryRepresenting {

    let identifier: Int
    let name: String
    let address: String
    /// Must be separated from `owner`. Thanks to that, both `Codable` and `RepositoryRepresenting` are conformed.
    let innerOwner: RepoOwner
    let starsCount: Int

    var owner: RepoOwnerRepresenting {
        return innerOwner
    }

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case address = "url"
        case innerOwner = "owner"
        case starsCount = "stargazers_count"
    }
}
