//
//  MockRepository.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

struct MockRepository: RepositoryRepresenting {
    var identifier: Int = 120

    var name: String = String.init(repeating: "myMock", count: 25)

    var address: String = "http://www.github.com"

    var owner: RepoOwnerRepresenting = MockOwner()

    var starsCount: Int = 15

}

struct MockOwner: RepoOwnerRepresenting {
    var login: String = "nodejs"

    var avatarAddress: String = "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"

    var profileAddress: String = "https://www.github.com/nodejs"

}
