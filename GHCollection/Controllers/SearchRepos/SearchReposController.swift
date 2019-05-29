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
    let searchView = SearchReposView()
    let searchBar = RepoSearchBar()
    var collectionView: UICollectionView {
        return searchView.collectionView
    }
    var dataGetter: Promise<Int>

    init() {
        dataGetter = dataSource.getData()
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupCollectionView()
        firstly {
            dataGetter
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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        self.view.addSubview(searchBar)
        self.view.addSubview(searchView)
        searchView.position(below: searchBar)
    }

    private func setupCollectionView() {
        collectionView.register(SearchRepoCell.self, forCellWithReuseIdentifier: "\(SearchRepoCell.self)")
        collectionView.dataSource = dataSource
        collectionView.prefetchDataSource = dataSource
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        flowLayout.setSizeFor(superview: self.view)
    }

}

extension SearchReposController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row + 1) == collectionView.numberOfItems(inSection: indexPath.section) {
            downloadMore()
        }
    }

    private func downloadMore() {
        guard !self.dataGetter.isPending else {
            return
        }
        firstly { () -> Promise<Int> in
            dataGetter = dataSource.getData()
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
