//
//  FollowersListVCDelegate.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation

protocol FollowerListVCDelegate: class {
    func didRequestFollowers(for username: String)
}
