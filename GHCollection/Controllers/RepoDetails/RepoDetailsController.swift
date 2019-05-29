//
//  RepoDetailsController.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit

final class RepoDetailsController: UIViewController {

    let subview = RepoDetailsView()
    let repository: RepositoryRepresenting

    init(with repository: RepositoryRepresenting) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        self.view.addSubview(subview)
        subview.configure(with: repository)
    }
}
