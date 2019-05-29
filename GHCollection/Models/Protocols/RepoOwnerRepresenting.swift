//
//  RepoOwnerRepresenting.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

protocol RepoOwnerRepresenting {
    var login: String { get }
    var avatarAddress: String { get }
    var profileAddress: String { get }
}
