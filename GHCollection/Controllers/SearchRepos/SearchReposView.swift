//
//  SearchReposView.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import SnapKit

class SearchReposView: UIView {

    let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    init() {
        super.init(frame: .zero)
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
