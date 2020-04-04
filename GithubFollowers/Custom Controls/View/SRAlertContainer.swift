//
//  SRAlertContainer.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-02.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SLAlertContainer: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .systemBackground
    }
}
