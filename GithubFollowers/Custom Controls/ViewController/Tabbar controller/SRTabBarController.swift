//
//  SRTabBarController.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }

    func configureTabBar() {
        setUpUI()
        let searchFollowersVC = configureSearchFollowersVC()
        let favouritesVC = configureFavouritesVC()
        viewControllers = [searchFollowersVC, favouritesVC]
    }

    func setUpUI() {
        tabBar.tintColor = .systemPurple
        UINavigationBar.appearance().tintColor = .systemPurple
    }

    func configureSearchFollowersVC() -> UIViewController {
        let searchFollowerVC = SearchFollowersVC()
        searchFollowerVC.title = "Search"
        searchFollowerVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        return UINavigationController(rootViewController: searchFollowerVC)
    }

    func configureFavouritesVC() -> UIViewController {
        let favouriteVC = UIViewController()
        favouriteVC.title = "Favourites"
        favouriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        return UINavigationController(rootViewController: favouriteVC)
    }

}
