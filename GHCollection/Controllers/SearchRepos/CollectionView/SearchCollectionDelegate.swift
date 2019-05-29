//
//  SearchCollectionDelegate.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

final class SearchCollectionDelegate: NSObject, UICollectionViewDelegate {

    weak var reloader: CollectionViewReloading?
    weak var detailsPresenting: DetailsPresenting?

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let offsetRow = indexPath.row + 1
        let count = collectionView.numberOfItems(inSection: indexPath.section)
        if offsetRow == count {
            reloader?.didScrollToEnd()
        }
    }
}
