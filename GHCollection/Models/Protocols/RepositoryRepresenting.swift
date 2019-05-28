//
//  RepositoryRepresenting.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

protocol RepositoryRepresenting {
    var identifier: Int { get }
    var name: String { get }
    var address: String { get }
    var owner: RepoOwnerRepresenting { get }
    var starsCount: Int { get }
}
