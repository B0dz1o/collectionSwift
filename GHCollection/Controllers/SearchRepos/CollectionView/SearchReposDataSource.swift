//
//  SearchReposDataSource.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

class SearchReposDataSource: NSObject {

    let searchCellIdentifier = "\(SearchRepoCell.self)"

}

extension SearchReposDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TODO match with API
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.searchCellIdentifier, for: indexPath)
        if let searchCell = cell as? SearchRepoCell {
            searchCell.configure(with: MockRepository())
        }
        return cell
    }
}

extension SearchReposDataSource: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        //TODO prefetch images
        return
    }
}
