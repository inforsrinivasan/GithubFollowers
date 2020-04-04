//
//  SRitemInfoVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-04.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRItemInfoVC: UIViewController {

    let stackView = UIStackView()
    let itemView1 = SRItemInfoView()
    let itemView2 = SRItemInfoView()
    let actionButton = SRButton()

    weak var delegate: UserInfoVCDelegate!

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
        configureBackgroundView()
        layoutUI()
        configureStackView()
        configureActionButton()
    }

    private func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }

    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(itemView1)
        stackView.addArrangedSubview(itemView2)
        stackView.addArrangedSubview(UIView())
    }

    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }


    @objc func actionButtonTapped() {
    }

    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(actionButton)

        let padding: CGFloat = 20

        stackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: padding, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
        actionButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: padding, bottom: padding, right: padding), size: .init(width: 0, height: 44))
    }
}
