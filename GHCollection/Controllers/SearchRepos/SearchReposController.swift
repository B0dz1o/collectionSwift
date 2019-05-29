//
//  ViewController.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

final class SearchReposController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = SearchReposView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
