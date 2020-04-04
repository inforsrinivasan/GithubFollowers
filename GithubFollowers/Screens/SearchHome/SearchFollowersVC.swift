//
//  SearchFollowersVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SearchFollowersVC: UIViewController {

    let githubImageView = UIImageView()
    let searchTextField = SRTextField(placeholder: "Enter a username")
    let followersButton = SRButton(withColor: .systemPurple, withTitle: "Get Followers")

    var isUserNameEntered: Bool {
        return !(searchTextField.text ?? "").isEmpty ? true : false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureGithubImageView()
        configureSearchTextField()
        configureFollowersButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: Configure Button

    private func configureFollowersButton() {
        followersButton.addTarget(self, action: #selector(getFollowersAction), for: .touchUpInside)
        view.addSubview(followersButton)
        followersButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 50, bottom: 50, right: 50), size: .init(width: 0, height: 50))
    }

    // MARK: Configure Github Logo

    private func configureGithubImageView() {
        view.addSubview(githubImageView)
        githubImageView.image = Images.ghLogo
        githubImageView.centerXInSuperview()
        githubImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 80, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 200))
    }

    // MARK: Configure Search Text Field

    private func configureSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.anchor(top: githubImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 50, bottom: 0, right: 50), size: .init(width: 0, height: 50))
    }

    // MARK: IBAction

    @objc
    func getFollowersAction() {
        guard isUserNameEntered else {
            presentSRAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀", buttonTitle: "Ok")
            return
        }
        let searchFolloersVC = SRFollowersListVC(username: searchTextField.text!)
        navigationController?.pushViewController(searchFolloersVC, animated: true)
    }

}
