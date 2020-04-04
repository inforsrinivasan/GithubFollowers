//
//  User.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation

struct User: Codable {
    let login:                  String
    let avatarUrl:              String
    var name:                   String?
    var location:               String?
    var bio:                    String?
    let publicRepos:            Int
    let publicGists:            Int
    var hirable:                Bool?
    let htmlUrl:                String
    let following:              Int
    let followers:              Int
    let createdAt:              Date
}
