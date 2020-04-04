//
//  SRRepoItemVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRRepoItemVC: SRItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }


    private func configureItems() {
        itemView1.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemView2.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(background: .systemPurple, title: "GitHub Profile")
    }

    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
