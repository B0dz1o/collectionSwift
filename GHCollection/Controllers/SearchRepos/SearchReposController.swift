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
