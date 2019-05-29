//
//  CollectionViewReloading.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

protocol CollectionViewReloading: class {

    func search(queryChanged query: String)
    func didScrollToEnd()

}
