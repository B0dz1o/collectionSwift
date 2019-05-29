//
//  SearchReposDataSource.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import PromiseKit

class SearchReposDataSource: NSObject {

    let searchCellIdentifier = "\(SearchRepoCell.self)"
    let pageSize: UInt = 40

    let mockQuery: String
    var repositories: [RepositoryRepresenting] = []

    override init() {
        let queries = ["python", "nodejs", "rails", "react"]
        let index = Int(arc4random()) % queries.count
        mockQuery = queries[index]
        super.init()
    }

    func getData() -> Promise<Int> {
        /// pages are 1-based on Github. See https://developer.github.com/v3/#pagination
        let page = UInt(floor(Double(repositories.count) / Double(pageSize))) + 1
        let promise = GithubSearchProxy().getResults(query: mockQuery, page: page, perPage: pageSize).then { (result) -> Promise<Int> in
            let items = result.items
            self.repositories.append(contentsOf: items)
            return Promise.value(items.count)
        }
        return promise
    }

}

extension SearchReposDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.searchCellIdentifier, for: indexPath)
        if let searchCell = cell as? SearchRepoCell {
            searchCell.configure(with: repositories[indexPath.row])
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
