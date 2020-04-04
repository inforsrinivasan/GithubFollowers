//
//  UserInfoVCDelegate.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation

protocol UserInfoVCDelegate: class {
    func didTapGitHubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}
