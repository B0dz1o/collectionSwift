//
//  SearchRepoCell.swift
//  GHCollection
//
//  Created by Piotr Bogdan on 29/05/2019.
//  Copyright © 2019 Piotr Bogdan. All rights reserved.
//

import UIKit
import SnapKit

class SearchRepoCell: UICollectionViewCell {

    let avatar = UIImageView()
    let lblTitle = UILabel()
    let lblOwner = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        setConstraints()
        avatar.image = nil
    }

    func configure(with repository: RepositoryRepresenting) {
        //TODO replace placeholder with Kingfisher cache
        self.avatar.image = UIImage(named: "AvatarPlaceholder")
        self.lblTitle.text = repository.name
        self.lblOwner.text = repository.owner.login
    }

    private func setConstraints() {
        setAvatarConstraints()
        setTitleConstraints()
        setOwnerConstraints()
    }

    private func addSubviews() {
        self.addSubview(avatar)
        self.addSubview(lblTitle)
        self.addSubview(lblOwner)
    }

    private func setAvatarConstraints() {
        avatar.snp.makeConstraints { (maker) in
            maker.height.equalTo(avatar.snp.width)
            maker.leftMargin.equalToSuperview()
            maker.topMargin.equalToSuperview()
            maker.bottomMargin.equalToSuperview()
        }
    }

    private func setTitleConstraints() {
        lblTitle.snp.makeConstraints { (maker) in
            let leftOffset = 16
            maker.leftMargin.equalTo(avatar.snp.right).offset(leftOffset)
            maker.topMargin.equalToSuperview()
            maker.rightMargin.equalToSuperview()
            maker.bottomMargin.equalTo(lblOwner.snp.topMargin)
        }
        lblTitle.numberOfLines = 2
        lblTitle.lineBreakMode = .byTruncatingTail
    }

    private func setOwnerConstraints() {
        lblOwner.snp.makeConstraints { (maker) in
            maker.leftMargin.equalTo(lblTitle.snp.leftMargin)
            maker.bottomMargin.equalToSuperview()
            maker.rightMargin.equalTo(lblTitle.snp.rightMargin)
        }
        lblOwner.numberOfLines = 2
        lblOwner.lineBreakMode = .byTruncatingTail
    }
}
