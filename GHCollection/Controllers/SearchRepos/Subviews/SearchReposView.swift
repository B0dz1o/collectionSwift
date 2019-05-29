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
        self.translatesAutoresizingMaskIntoConstraints = true
        self.configureColors()
        self.configureConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureConstraints() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }

    private func configureColors() {
        self.backgroundColor = .white
        collectionView.backgroundColor = .clear
    }

    override func didMoveToSuperview() {
        self.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func position(below view: UIView) {
        self.snp.remakeConstraints { (maker) in
            maker.top.equalTo(view.snp.bottom)
        }
    }
}
