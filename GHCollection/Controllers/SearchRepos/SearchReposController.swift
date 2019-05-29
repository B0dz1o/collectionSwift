//
//  ViewController.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import PromiseKit

final class SearchReposController: UIViewController {

    let dataSource = SearchReposDataSource()
    let flowLayout = SearchReposFlowLayout()
    let collectionDelegateRef = SearchCollectionDelegate()
    let searchView = SearchReposView()
    let searchBar = RepoSearchBar()
    let searchBarDelegateRef = SearchBarDelegate()

    var lastQuery: String?
    var collectionView: UICollectionView {
        return searchView.collectionView
    }
    var dataGetter: Promise<Int>?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        self.view.addSubview(searchBar)
        self.view.addSubview(searchView)
        searchView.position(below: searchBar)
        searchBar.delegate = searchBarDelegateRef
        searchBarDelegateRef.reloader = self
    }

    private func setupCollectionView() {
        collectionView.register(SearchRepoCell.self, forCellWithReuseIdentifier: "\(SearchRepoCell.self)")
        collectionView.dataSource = dataSource
        collectionView.prefetchDataSource = dataSource
        collectionView.delegate = collectionDelegateRef
        collectionDelegateRef.reloader = self
        collectionDelegateRef.detailsPresenting = self
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        flowLayout.setSizeFor(superview: self.view)
    }

    private func downloadData(refresh: Bool) {
        guard let query = lastQuery else {
            return
        }
        let isPending = self.dataGetter?.isPending ?? false
        guard !isPending else {
            return
        }
        firstly { () -> Promise<Int> in
            let dataGetter = dataSource.getData(forQuery: query, refresh: refresh)
            self.dataGetter = dataGetter
            return dataGetter
        }
        .done { (count) in
            guard count > 0 else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
        .catch { (error) in
            #if DEBUG
            print(error)
            #endif
        }
    }
}

extension SearchReposController: CollectionViewReloading {
    func search(queryChanged query: String) {
        if let lastQuery = self.lastQuery, lastQuery == query {
            return
        }
        self.lastQuery = query
        downloadData(refresh: true)
    }

    func didScrollToEnd() {
        downloadData(refresh: false)
    }
}

extension SearchReposController: DetailsPresenting {
    func showDetailsFor(indexPath: IndexPath) {
        guard let repository = dataSource.dataFor(indexPath: indexPath) else {
            return
        }
        let detailsController = RepoDetailsController(with: repository)
        self.navigationController?.pushViewController(detailsController, animated: true)
    }

}
