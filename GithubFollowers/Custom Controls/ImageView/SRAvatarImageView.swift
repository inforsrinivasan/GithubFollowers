//
//  SRAvatarImageView.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-03.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRAvatarImageView: UIImageView {

    let placeholderImage = Images.avatarPlaceholder

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }

}
