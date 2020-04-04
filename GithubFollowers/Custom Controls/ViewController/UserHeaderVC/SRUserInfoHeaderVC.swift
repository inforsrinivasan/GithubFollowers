//
//  SRUserInfoHeaderVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRUserInfoHeaderVC: UIViewController {

    let avatarImageView             = SRAvatarImageView(frame: .zero)
    let usernameLabel               = SRTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel                   = SRTitleLabel(textAlignment: .left, fontSize: 18)
    let locationImageView           = UIImageView()
    let locationLabel               = SRTitleLabel(textAlignment: .left, fontSize: 18)
    let bioLabel                    = SRBodyLabel(textAlignment: .left)

    var user: User!

    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        layoutUI()
        configureUIElements()
    }

    func configureUIElements() {
        downloadAvatarImage()
        usernameLabel.text          = user.login
        nameLabel.text              = user.name ?? ""
        locationLabel.text          = user.location ?? "No Location"
        bioLabel.text               = user.bio ?? "No bio available"
        bioLabel.numberOfLines      = 3
        locationImageView.image     = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }

    func downloadAvatarImage() {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }

    func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }

    func layoutUI(){
        let padding: CGFloat                = 20
        let textImagePadding:CGFloat        = 12

        avatarImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: padding, left: 0, bottom: 0, right: 0), size: .init(width: 90, height: 90))
        usernameLabel.anchor(top: avatarImageView.topAnchor, leading: avatarImageView.trailingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: textImagePadding, bottom: 0, right: 0), size: .init(width: 0, height: 38))
        nameLabel.anchor(top: nil, leading: avatarImageView.trailingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: textImagePadding, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        nameLabel.centerYAnchor(anchor: avatarImageView.centerYAnchor, constant: 8)
        locationImageView.anchor(top: nil, leading: avatarImageView.trailingAnchor, bottom: avatarImageView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: textImagePadding, bottom: 0, right: 0), size: .init(width: 20, height: 20))
        locationLabel.anchor(top: nil, leading: locationImageView.trailingAnchor, bottom: avatarImageView.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 0), size: .init(width: 0, height: 20))
        bioLabel.anchor(top: avatarImageView.bottomAnchor, leading: avatarImageView.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: textImagePadding, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 60))

    }
}
