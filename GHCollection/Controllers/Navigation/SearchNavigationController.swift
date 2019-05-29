//
//  SearchNavigationController.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

final class SearchNavigationController: UINavigationController {

    init() {
        super.init(rootViewController: SearchReposController())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
