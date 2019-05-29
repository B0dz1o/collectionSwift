//
//  RepoSearchBar.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import SnapKit

final class RepoSearchBar: UISearchBar {

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.snp.makeConstraints { (maker) in
            if let top = superview?.safeAreaLayoutGuide.snp.top {
                maker.top.equalTo(top)
            }
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
        }
    }

}
