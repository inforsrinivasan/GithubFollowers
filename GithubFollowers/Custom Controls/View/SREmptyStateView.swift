//
//  SREmptyStateView.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-03.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SREmptyStateView: UIView {

    let messageLabel = SRTitleLabel(textAlignment: .center, fontSize: 24)
    let emptyImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    convenience init(message: String, frame: CGRect) {
        self.init(frame: frame)
        messageLabel.text = message
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        setUpImageView()
        setUpLabel()
    }

    private func setUpLabel() {
        addSubview(messageLabel)
        messageLabel.anchor(top: nil, leading: leadingAnchor, bottom: centerYAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 30, bottom: 50, right: 30), size: .init(width: 0, height: 200))
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
    }

    private func setUpImageView() {
        addSubview(emptyImageView)
        emptyImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size: .zero)
        emptyImageView.image = Images.emptyStateLogo
        emptyImageView.contentMode = .bottom
    }
}
