//
//  RepoOwner.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

struct RepoOwner: Codable, RepoOwnerRepresenting {
    let login: String
    let avatarAddress: String
    let profileAddress: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarAddress = "avatar_url"
        case profileAddress = "url"
    }
}
