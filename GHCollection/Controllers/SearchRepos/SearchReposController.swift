//
//  ViewController.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 28/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

final class SearchReposController: UIViewController {

    let dataSource = SearchReposDataSource()
    let flowLayout = SearchReposFlowLayout()
    let searchView = SearchReposView()
    var collectionView: UICollectionView {
        return searchView.collectionView
    }

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
        self.view.addSubview(searchView)
    }

    private func setupCollectionView() {
        collectionView.register(SearchRepoCell.self, forCellWithReuseIdentifier: "\(SearchRepoCell.self)")
        collectionView.dataSource = dataSource
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
        collectionView.prefetchDataSource = dataSource
        flowLayout.setSizeFor(superview: self.view)
    }

}
