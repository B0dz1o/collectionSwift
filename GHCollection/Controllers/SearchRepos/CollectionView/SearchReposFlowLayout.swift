//
//  SearchReposFlowLayout.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

class SearchReposFlowLayout: UICollectionViewFlowLayout {

    private var defaultSize: CGSize = .zero

    override var itemSize: CGSize {
        get {
            return self.defaultSize
        }
        set {
            self.defaultSize = newValue
        }
    }

    func setSizeFor(superview: UIView) {
        let width = superview.frame.width
        let height: CGFloat = 100.0
        defaultSize = CGSize(width: width, height: height)
    }
}
