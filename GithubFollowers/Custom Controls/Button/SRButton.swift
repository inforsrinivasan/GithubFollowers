//
//  SRButton.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-01.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Custom Initilizer

    convenience init(withColor backgroundColor: UIColor, withTitle title: String) {
        self.init(frame: .zero)
        set(background: backgroundColor, title: title)
    }

    // MARK: Button Configuration

    private func configure() {
        layer.cornerRadius = 15
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    // MARK: Customize Button

    func set(background: UIColor, title: String) {
        backgroundColor = background
        setTitle(title, for: .normal)
    }

}
