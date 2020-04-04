//
//  UserInfoVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    let userDetailsView = UIView()
    let userGithubProfileView = UIView()
    let userFollowersView = UIView()
    let dateView = SRBodyLabel(textAlignment: .center)
    var username: String!

    weak var delegate: FollowerListVCDelegate!

    var itemViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }

    private func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        itemViews.append(contentsOf: [userDetailsView, userGithubProfileView, userFollowersView, dateView])
        itemViews.forEach {
            view.addSubview($0)
            $0.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: padding), size: .zero)
        }
        userDetailsView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .zero, size: .init(width: 0, height: 180))
        userGithubProfileView.anchor(top: userDetailsView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: padding, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: itemHeight))
        userFollowersView.anchor(top: userGithubProfileView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: itemHeight))
        dateView.anchor(top: userFollowersView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: padding, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 18))

    }

    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: self.username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(user: user) }
            case .failure(let error):
                print(error)
            }
        }
    }

    func configureUIElements(user: User) {
        let repoItemVC          = SRRepoItemVC(user: user)
        repoItemVC.delegate     = self

        let followerItemVC      = SRFollowersItemVC(user: user)
        followerItemVC.delegate = self

        self.add(childVC: SRUserInfoHeaderVC(user: user), containerView: self.userDetailsView)
        self.add(childVC: repoItemVC, containerView: self.userGithubProfileView)
        self.add(childVC: followerItemVC, containerView: self.userFollowersView)
        self.setDateLabel(with: user.createdAt)
    }

    func add(childVC: UIViewController, containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)

    }

    func setDateLabel(with date: Date) {
        let formatter           = DateFormatter()
        formatter.locale        = .current
        formatter.dateFormat    = "MMM yyyy"
        dateView.text          = "GitHub Since \(formatter.string(from: date))"
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

extension UserInfoVC: UserInfoVCDelegate {

    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentSRAlertOnMainThread(title: "Invalid URL", message: "The URL attached to this user is invalid", buttonTitle: "Oh no!")
            return
        }
        presentSafariVC(with: url)
    }

    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentSRAlertOnMainThread(title: "No followers", message: "This user has no followers. Go follow them 😇", buttonTitle: "On it!")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }



}
