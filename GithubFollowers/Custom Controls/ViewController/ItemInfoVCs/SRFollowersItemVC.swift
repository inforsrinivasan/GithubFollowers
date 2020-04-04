//
//  SRFollowersItemVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRFollowersItemVC: SRItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }


    private func configureItems() {
        itemView1.set(itemInfoType: .followers, withCount: user.followers)
        itemView2.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(background: .systemPurple, title: "Get Followers")
    }

    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
