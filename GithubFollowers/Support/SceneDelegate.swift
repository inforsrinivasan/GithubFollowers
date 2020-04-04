//
//  SceneDelegate.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController.init(rootViewController: SearchFollowersVC())
        window?.makeKeyAndVisible()

    }

}

