//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-03.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {

    static let reuseID = "FollowerCell"
    
    let avatarImageView = SRAvatarImageView(frame: .zero)
    let nameLabel = SRTitleLabel(textAlignment: .center, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(follower: Follower) {
        nameLabel.text = follower.login
        NetworkManager.shared.downloadImage(from: follower.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }

    private func configure() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        avatarImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .zero)
        avatarImageView.sameHeight(widthAnchor: avatarImageView.widthAnchor)
        nameLabel.anchor(top: avatarImageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 12, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 20))
        avatarImageView.contentMode = .scaleAspectFit
    }

}
