//
//  RepoDetailsView.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import SnapKit

final class RepoDetailsView: UIView {

    let avatar = UIImageView()
    let lblTitle = UILabel()
    let lblOwner = UILabel()

    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = true
        self.addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        for view in [avatar, lblTitle, lblOwner] {
            self.addSubview(view)
        }
    }

    private func configureConstraints() {
        self.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        avatar.snp.makeConstraints { (maker) in
            maker.topMargin.equalToSuperview()
            maker.leftMargin.equalToSuperview()
            maker.height.equalTo(avatar.snp.width)
            maker.width.equalToSuperview().dividedBy(3)
        }
        lblTitle.snp.makeConstraints { (maker) in
            maker.topMargin.equalToSuperview().offset(8)
            maker.right.equalToSuperview()
            maker.left.equalTo(avatar.snp.right).offset(16)
        }
        lblTitle.numberOfLines = 1
        lblOwner.snp.makeConstraints { (maker) in
            maker.width.equalTo(avatar)
            maker.leftMargin.equalTo(avatar).offset(8)
            maker.right.equalTo(avatar)
            maker.top.equalTo(avatar.snp.bottom).offset(16)
        }
    }

    func configure(with repository: RepositoryRepresenting) {
        if let url = URL(string: repository.owner.avatarAddress) {
            self.avatar.kf.setImage(with: url)
        }
        self.lblTitle.text = repository.name
        self.lblOwner.text = repository.owner.login
        configureConstraints()
    }

}
